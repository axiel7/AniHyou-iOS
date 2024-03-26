//
//  MediaList.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension UserMediaListQuery.Data.Page.MediaList {
    var totalProgress: Int? {
        if self.media?.type?.value == .anime {
            return self.media?.episodes
        } else {
            return self.media?.chapters
        }
    }
    
    var shouldShowIncrementButton: Bool {
        if status?.value == .repeating
            || status?.value == .current
            || status?.value == .planning
        {
            return true
        }
        return false
    }

    var coverColorWithAlpha: Color? {
        if let color = self.media?.coverImage?.color {
            return Color(hex: color + "88")
        } else { return nil }
    }
    
    var uniqueListId: String? {
        return "\(self.mediaId)-\(self.id)"
    }
}

extension BasicMediaListEntry {
    var advancedScoresDict: [String: Double]? {
        self.advancedScores?.toAdvancedScores()
    }
}

extension CustomJSON {
    func toAdvancedScores() -> [String: Double] {
        switch self {
        case .dictionary(let dictionary):
            return dictionary.compactMapValues { $0 as? Double }
        case .array:
            return [:]
        }
    }
}
