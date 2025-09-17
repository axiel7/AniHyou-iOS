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

    var entry: BasicMediaListEntry?

    @Published var isLoading = false

    @Published var score: Double? {
        didSet {
            if let value = score, value > scoreMax {
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
            100
        case .point10, .point10Decimal:
            10
        case .point5:
            5
        case .point3:
            3
        }
    }

    var scoreHint: String {
        String(format: "%.0f", scoreMax)
    }

    var scoreStep: Double {
        switch scoreFormat {
        case .point100, .point10, .point5, .point3:
            1
        case .point10Decimal:
            0.5
        }
    }

    @Published var isUpdateSuccess = false

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
        customLists: [String: Bool],
        notes: String?
    ) async {
        isLoading = true
        
        if let updatedEntry = await MediaListRepository.updateEntry(
            oldEntry: entry,
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
            customLists: customLists.isEmpty ? nil : customLists,
            notes: notes
        ) {
            self.entry = updatedEntry
            NotificationCenter.default.post(name: "updatedMediaListEntry", object: updatedEntry)
            isUpdateSuccess = true
            isLoading = false
        } else {
            isLoading = false
        }
    }

    @Published var isDeleteSuccess = false

    func deleteEntry() async {
        guard let entryId = entry?.id else { return }
        isLoading = true
        isDeleteSuccess = await MediaListRepository.deleteEntry(entryId: entryId) == true
        isLoading = false
    }
}
