//
//  MediaInfoType.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import Foundation

public enum MediaInfoType: Equatable, Hashable, CaseIterable {
    case general
    case charactersAndStaff
    case relationsAndRecommendations
    case stats
    case reviewsAndThreads
}

extension MediaInfoType {
    var localizedName: String {
        switch self {
        case .general:
            return "General"
        case .charactersAndStaff:
            return "Characters and Staff"
        case .relationsAndRecommendations:
            return "Relations and Recommendations"
        case .stats:
            return "Stats"
        case .reviewsAndThreads:
            return "Review and Threads"
        }
    }

    var systemImage: String {
        switch self {
        case .general:
            return "info.circle"
        case .charactersAndStaff:
            return "person"
        case .relationsAndRecommendations:
            return "shuffle"
        case .stats:
            return "percent"
        case .reviewsAndThreads:
            return "square.and.pencil"
        }
    }
}
