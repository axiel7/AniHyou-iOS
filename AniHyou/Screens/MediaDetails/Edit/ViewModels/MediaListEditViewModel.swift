//
//  MediaListEditViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/6/22.
//

import Foundation
import AniListAPI

class MediaListEditViewModel: ObservableObject {

    var oldEntry: BasicMediaListEntry?

    @Published var isLoading = false

    @Published var score: Double = 0 {
        didSet {
            if score > scoreMax {
                score = oldValue
            }
        }
    }

    var scoreFormat: ScoreFormat {
        if let formatRaw = UserDefaults.standard.string(forKey: USER_SCORE_KEY) {
            return ScoreFormat(rawValue: formatRaw) ?? .point10
        } else { return .point10 }
    }

    var scoreMax: Double {
        switch scoreFormat {
        case .point100:
            return 100
        case .point10, .point10Decimal:
            return 10
        case .point5:
            return 5
        case .point3:
            return 3
        }
    }

    var scoreHint: String {
        return String(format: "%.0f", scoreMax)
    }

    var scoreRange: ClosedRange<Double> {
        return 0...scoreMax
    }

    var scoreStep: Double {
        switch scoreFormat {
        case .point100, .point10, .point5, .point3:
            return 1
        case .point10Decimal:
            return 0.5
        }
    }

    @Published var isUpdateSuccess = false
    var updatedEntry: BasicMediaListEntry?

    // swiftlint:disable function_parameter_count cyclomatic_complexity function_body_length
    func updateEntry(
        mediaId: Int,
        status: MediaListStatus?,
        score: Double?,
        progress: Int?,
        progressVolumes: Int?,
        startedAt: Date?,
        completedAt: Date?,
        repeatCount: Int?,
        isPrivate: Bool?,
        notes: String?
    ) {
        isLoading = true
        Task {
            var setStatus = status
            if status == oldEntry?.status?.value { setStatus = nil }
            
            var setScore = score
            if score == oldEntry?.score { setScore = nil }
            
            var setProgress = progress
            if progress == oldEntry?.progress { setProgress = nil }
            
            var setProgressVolumes = progressVolumes
            if progressVolumes == oldEntry?.progressVolumes { setProgressVolumes = nil }
            
            var setStartedAt = startedAt?.toFuzzyDate()
            if oldEntry?.startedAt?.fragments.fuzzyDateFragment.isEqual(setStartedAt) == true {
                setStartedAt = nil
            }
            var startedAtQL = someIfNotNil(setStartedAt)
            if startedAt == nil { startedAtQL = .null } //remove date
            
            var setCompletedAt = completedAt?.toFuzzyDate()
            if oldEntry?.completedAt?.fragments.fuzzyDateFragment.isEqual(setCompletedAt) == true {
                setCompletedAt = nil
            }
            var completedAtQL = someIfNotNil(setCompletedAt)
            if completedAt == nil { completedAtQL = .null } //remove date
            
            var setRepeat = repeatCount
            if repeatCount == oldEntry?.repeat { setRepeat = nil }
            
            var setIsPrivate = isPrivate
            if isPrivate == oldEntry?.private { setIsPrivate = nil }
            
            var setNotes = notes
            if notes == oldEntry?.notes { setNotes = nil }
            
            if let updatedEntry = await MediaListRepository.updateEntry(
                mediaId: mediaId,
                status: setStatus,
                score: setScore,
                progress: setProgress,
                progressVolumes: setProgressVolumes,
                startedAt: startedAtQL,
                completedAt: completedAtQL,
                repeatCount: setRepeat,
                isPrivate: setIsPrivate,
                notes: setNotes
            ) {
                DispatchQueue.main.async { [weak self] in
                    self?.updatedEntry = updatedEntry
                    self?.isUpdateSuccess = true
                    self?.isLoading = false
                }
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.isLoading = false
                }
            }
        }
    }
    // swiftlint:enable function_parameter_count cyclomatic_complexity function_body_length

    @Published var isDeleteSuccess = false

    func deleteEntry(entryId: Int) {
        isLoading = true
        Network.shared.apollo.perform(mutation: DeleteMediaListMutation(
            mediaListEntryId: .some(entryId)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let deleted = graphQLResult.data?.deleteMediaListEntry?.deleted {
                    self?.isDeleteSuccess = deleted
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
}
