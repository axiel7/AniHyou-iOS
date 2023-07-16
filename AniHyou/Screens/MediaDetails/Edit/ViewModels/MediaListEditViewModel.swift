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

    // swiftlint:disable function_parameter_count function_body_length cyclomatic_complexity
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
        var setStatus = status
        if status == oldEntry?.status?.value { setStatus = nil }

        var setScore = score
        if score == oldEntry?.score { setScore = nil }

        var setProgress = progress
        if progress == oldEntry?.progress { setProgress = nil }

        var setProgressVolumes = progressVolumes
        if progressVolumes == oldEntry?.progressVolumes { setProgressVolumes = nil }

        var setStartedAt = startedAt?.toFuzzyDate()
        if oldEntry?.startedAt?.fragments.fuzzyDateFragment.isEqual(setStartedAt) == true { setStartedAt = nil }
        var startedAtQL = someIfNotNil(setStartedAt)
        if startedAt == nil { startedAtQL = .null } //remove date

        var setCompletedAt = completedAt?.toFuzzyDate()
        if oldEntry?.completedAt?.fragments.fuzzyDateFragment.isEqual(setCompletedAt) == true { setCompletedAt = nil }
        var completedAtQL = someIfNotNil(setCompletedAt)
        if completedAt == nil { completedAtQL = .null } //remove date

        var setRepeat = repeatCount
        if repeatCount == oldEntry?.repeat { setRepeat = nil }

        var setIsPrivate = isPrivate
        if isPrivate == oldEntry?.private { setIsPrivate = nil }

        var setNotes = notes
        if notes == oldEntry?.notes { setNotes = nil }

        Network.shared.apollo.perform(mutation: UpdateEntryMutation(
            mediaId: .some(mediaId),
            status: someIfNotNil(setStatus),
            score: someIfNotNil(setScore),
            progress: someIfNotNil(setProgress),
            progressVolumes: someIfNotNil(setProgressVolumes),
            startedAt: startedAtQL,
            completedAt: completedAtQL,
            repeat: someIfNotNil(setRepeat),
            private: someIfNotNil(setIsPrivate),
            notes: someIfNotNil(setNotes)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.saveMediaListEntry {
                    if let errors = graphQLResult.errors {
                        for error in errors {
                            print(error)
                        }
                    } else {
                        self?.updatedEntry = data.fragments.basicMediaListEntry
                        self?.isUpdateSuccess = true
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
    // swiftlint:enable function_parameter_count function_body_length cyclomatic_complexity

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
