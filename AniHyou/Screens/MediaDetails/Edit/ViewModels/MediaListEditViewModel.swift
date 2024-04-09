//
//  MediaListEditViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/6/22.
//

import Foundation
import AniListAPI

@MainActor
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

    // swiftlint:disable:next function_parameter_count
    func updateEntry(
        mediaId: Int,
        status: MediaListStatus?,
        score: Double?,
        advancedScoresDict: [String: Double]?,
        progress: Int?,
        progressVolumes: Int?,
        startedAt: Date?,
        completedAt: Date?,
        repeatCount: Int?,
        isPrivate: Bool?,
        isHiddenFromStatusLists: Bool?,
        notes: String?
    ) async {
        isLoading = true
        
        if let updatedEntry = await MediaListRepository.updateEntry(
            oldEntry: oldEntry,
            mediaId: mediaId,
            status: status,
            score: score,
            advancedScores: advancedScoresDict,
            progress: progress,
            progressVolumes: progressVolumes,
            startedAt: startedAt,
            completedAt: completedAt,
            repeatCount: repeatCount,
            isPrivate: isPrivate,
            isHiddenFromStatusLists: isHiddenFromStatusLists,
            notes: notes
        ) {
            self.updatedEntry = updatedEntry
            NotificationCenter.default.post(name: "updatedMediaListEntry", object: updatedEntry)
            isUpdateSuccess = true
            isLoading = false
        } else {
            isLoading = false
        }
    }

    @Published var isDeleteSuccess = false

    func deleteEntry(entryId: Int) async {
        isLoading = true
        isDeleteSuccess = await MediaListRepository.deleteEntry(entryId: entryId) == true
        isLoading = false
    }
}
