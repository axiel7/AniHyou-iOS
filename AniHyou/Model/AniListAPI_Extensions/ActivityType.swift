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
            return nil
        case .text:
            return .text
        case .listProgress:
            return .mediaList
        }
    }
    
    var lozalizedName: LocalizedStringKey {
        switch self {
        case .all:
            return "All"
        case .text:
            return "Text Status"
        case .listProgress:
            return "List Progress"
        }
    }
}
