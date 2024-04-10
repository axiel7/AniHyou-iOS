//
//  MediaInfoType.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import Foundation
import SwiftUI

public enum MediaInfoType: Equatable, Hashable, CaseIterable {
    case general
    case charactersAndStaff
    case relationsAndRecommendations
    case stats
    case reviewsAndThreads
}

extension MediaInfoType {
    var localizedName: LocalizedStringKey {
        switch self {
        case .general:
            "General"
        case .charactersAndStaff:
            "Characters and Staff"
        case .relationsAndRecommendations:
            "Relations and Recommendations"
        case .stats:
            "Stats"
        case .reviewsAndThreads:
            "Review and Threads"
        }
    }

    var systemImage: String {
        switch self {
        case .general:
            "info.circle"
        case .charactersAndStaff:
            "person"
        case .relationsAndRecommendations:
            "shuffle"
        case .stats:
            "percent"
        case .reviewsAndThreads:
            "square.and.pencil"
        }
    }
}
