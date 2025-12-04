//
//  MediaList.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension CommonMediaListEntry {
    var uniqueListId: String? {
        "\(self.mediaId)-\(self.id)"
    }
    
    var isBehind: Bool {
        (progress ?? 0) < (media?.nextAiringEpisode?.episode.minus(1) ?? 0)
    }
    
    var episodesBehind: Int {
        (media?.nextAiringEpisode?.episode.minus(1) ?? 0) - (progress ?? 0)
    }
}

extension ShouUserMediaList {
    var uniqueListId: String? {
        "\(self.mediaId)-\(self.id)"
    }
    
    var coverColorWithAlpha: Color? {
        if let color = self.media?.coverImage?.color {
            return Color(hex: color + "88")
        } else { return nil }
    }
    
    var totalProgress: Int? {
        switch media?.type?.value {
        case .anime:
            media?.episodes
        case .manga:
            media?.chapters
        default:
            nil
        }
    }
    
    var isVolumeProgress: Bool {
        (progress == nil || progress == 0) && (progressVolumes ?? 0) > 0
    }
    
    var progressPreferred: Int? {
        if isVolumeProgress {
            progressVolumes
        } else {
            progress
        }
    }
    
    var maxProgress: Int? {
        switch media?.type?.value {
        case .anime:
            media?.episodes
        case .manga:
            if isVolumeProgress {
                media?.volumes
            } else {
                media?.chapters
            }
        default:
            nil
        }
    }
}

extension BasicMediaListEntry {
    var isVolumeProgress: Bool {
        (progress == nil || progress == 0) && (progressVolumes ?? 0) > 0
    }
    
    var progressPreferred: Int? {
        if isVolumeProgress {
            progressVolumes
        } else {
            progress
        }
    }
    
    func isBehind(nextAiringEpisode: Int?) -> Bool {
        (progress ?? 0) < (nextAiringEpisode ?? 0) - 1
    }
    
    var advancedScoresDict: [String: Double]? {
        self.advancedScores?.toAdvancedScores()
    }
    
    var customListsDict: [String: Bool]? {
        self.customLists?.toCustomLists()
    }
    
    var shouldShowIncrementButton: Bool {
        status?.value == .repeating
            || status?.value == .current
            || status?.value == .planning
    }
}

extension CustomJSON {
    func toAdvancedScores() -> [String: Double] {
        switch self {
        case .dictionary(let dictionary):
            dictionary.compactMapValues { $0 as? Double }
        case .array:
            [:]
        }
    }
    
    func toCustomLists() -> [String: Bool] {
        switch self {
        case .dictionary(let dictionary):
            dictionary.compactMapValues { $0 as? Bool }
        case .array:
            [:]
        }
    }
}
