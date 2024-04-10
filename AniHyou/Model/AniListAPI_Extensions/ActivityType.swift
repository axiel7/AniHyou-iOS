//
//  ActivityType.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import Foundation
import SwiftUI
import AniListAPI

enum ActivityFeedType: CaseIterable, Hashable {
    case all
    case text
    case listProgress
    
    var value: ActivityType? {
        switch self {
        case .all:
            nil
        case .text:
            .text
        case .listProgress:
            .mediaList
        }
    }
    
    var lozalizedName: LocalizedStringKey {
        switch self {
        case .all:
            "All"
        case .text:
            "Text Status"
        case .listProgress:
            "List Progress"
        }
    }
}
