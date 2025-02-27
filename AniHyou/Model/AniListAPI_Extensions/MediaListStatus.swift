//
//  MediaListStatus.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension MediaListStatus {
    
    var localizedStringKey: String {
        switch self {
        case .current:
            "Current"
        case .completed:
            "Completed"
        case .paused:
            "Paused"
        case .planning:
            "Planning"
        case .dropped:
            "Dropped"
        case .repeating:
            "Repeating"
        }
    }

    var localizedName: LocalizedStringKey {
        LocalizedStringKey(stringLiteral: localizedStringKey)
    }
    
    func localizedStringKey(type: MediaType) -> String {
        if self == .current {
            type == .anime ? "Watching" : "Reading"
        } else if self == .repeating {
            type == .anime ? "Rewatching" : "Rereading"
        } else {
            localizedStringKey
        }
    }
    
    func localizedName(type: MediaType) -> LocalizedStringKey {
        LocalizedStringKey(stringLiteral: localizedStringKey(type: type))
    }

    /// System symbol name representing this status
    var systemImage: String {
        switch self {
        case .current:
            "play.circle"
        case .completed:
            "checkmark.circle"
        case .paused:
            "pause.circle"
        case .planning:
            "clock"
        case .dropped:
            "trash"
        case .repeating:
            "repeat"
        }
    }

    var color: Color {
        switch self {
        case .current:
            .blue
        case .planning:
            .green
        case .completed:
            .purple
        case .dropped:
            .red
        case .paused:
            .yellow
        case .repeating:
            .blue
        }
    }
    
    static let listNames = ["Watching", "Reading", "Planning", "Completed", "Dropped", "Paused", "Repeating"]
}

extension MediaListStatus? {
    var statusesCanChangeTo: [MediaListStatus] {
        switch self {
        case nil:
            [.planning]
        case .current, .repeating:
            [.completed, .dropped, .paused]
        case .completed:
            [.repeating]
        case .paused, .dropped, .planning:
            [.current]
        }
    }
}

extension MediaType {
    var currentListStatus: LocalizedStringKey {
        self == .anime ? "Watching" : "Reading"
    }
}

extension String {
    func asMediaListStatus() -> MediaListStatus? {
        switch self {
        case "Current", "Watching", "Reading":
            return .current
        case "Planning":
            return .planning
        case "Completed":
            return .completed
        case "Dropped":
            return .dropped
        case "Paused":
            return .paused
        case "Repeating", "Rewatching", "Rereading":
            return .repeating
        default:
            if hasPrefix("Completed") {
                return .completed
            } else {
                return nil
            }
        }
    }
    
    func localizedListStatus(mediaType: MediaType) -> String {
        if hasPrefix("Completed ") {
            let localized = String(
                localized: String.LocalizationValue(stringLiteral: "Completed")
            )
            //TODO: localize format
            let format = replacing("Completed", with: "")
            return localized + format
        } else {
            let value = if self == "Current" {
                mediaType == .anime ? "Watching" : "Reading"
            } else if self == "Repeating" {
                mediaType == .anime ? "Rewatching" : "Rereading"
            } else {
                self
            }
            return String(
                localized: String.LocalizationValue(stringLiteral: value)
            )
        }
    }
}
