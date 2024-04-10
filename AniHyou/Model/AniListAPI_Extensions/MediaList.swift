//
//  MediaList.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension UserMediaListQuery.Data.Page.MediaList {

    var coverColorWithAlpha: Color? {
        if let color = self.media?.coverImage?.color {
            return Color(hex: color + "88")
        } else { return nil }
    }
    
    var uniqueListId: String? {
        "\(self.mediaId)-\(self.id)"
    }
}

extension BasicMediaListEntry {
    var advancedScoresDict: [String: Double]? {
        self.advancedScores?.toAdvancedScores()
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
}
