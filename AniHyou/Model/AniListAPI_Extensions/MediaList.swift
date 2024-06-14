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
}

extension CommonUserMediaList {
    var uniqueListId: String? {
        "\(self.mediaId)-\(self.id)"
    }
    
    var coverColorWithAlpha: Color? {
        if let color = self.media?.coverImage?.color {
            return Color(hex: color + "88")
        } else { return nil }
    }
    
    var isVolumeProgress: Bool {
        (progress == nil || progress == 0) && (progressVolumes ?? 0) > 0
    }
    
    var maxProgress: Int {
        switch media?.type?.value {
        case .anime:
            media?.episodes ?? 0
        case .manga:
            if isVolumeProgress {
                media?.volumes ?? 0
            } else {
                media?.chapters ?? 0
            }
        default:
            0
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
