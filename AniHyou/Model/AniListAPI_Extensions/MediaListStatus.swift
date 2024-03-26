//
//  MediaListStatus.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension MediaListStatus {

    var localizedName: LocalizedStringKey {
        switch self {
        case .current:
            return "Current"
        case .completed:
            return "Completed"
        case .paused:
            return "Paused"
        case .planning:
            return "Planning"
        case .dropped:
            return "Dropped"
        case .repeating:
            return "Repeating"
        }
    }

    /// System symbol name representing this status
    var systemImage: String {
        switch self {
        case .current:
            return "play.circle"
        case .completed:
            return "checkmark.circle"
        case .paused:
            return "pause.circle"
        case .planning:
            return "clock"
        case .dropped:
            return "trash"
        case .repeating:
            return "repeat"
        }
    }

    var color: Color {
        switch self {
        case .current:
            return .blue
        case .planning:
            return .green
        case .completed:
            return .purple
        case .dropped:
            return .red
        case .paused:
            return .yellow
        case .repeating:
            return .blue
        }
    }
}

enum MediaListStatusSelect: String, CaseIterable, Hashable {
    case all
    case current
    case planning
    case completed
    case dropped
    case paused
    case repeating
    
    var value: MediaListStatus? {
        switch self {
        case .all:
            return nil
        case .current:
            return .current
        case .planning:
            return .planning
        case .completed:
            return .completed
        case .dropped:
            return .dropped
        case .paused:
            return .paused
        case .repeating:
            return .repeating
        }
    }
    
    var localizedName: LocalizedStringKey {
        if self == .all {
            return "All"
        } else {
            return value?.localizedName ?? "None"
        }
    }
    
    var systemImage: String {
        if self == .all {
            return "list.bullet.circle"
        } else {
            return value?.systemImage ?? "list.bullet.circle"
        }
    }
}
