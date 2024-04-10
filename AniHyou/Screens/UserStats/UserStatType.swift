//
//  UserStatType.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/03/2023.
//

import Foundation
import SwiftUI

public enum UserStatType: Equatable, Hashable, CaseIterable {
    case overview
    case genres
    case tags
    case staff
    case voiceActors
    case studios
}

extension UserStatType {
    var isAnime: Bool {
        self == .voiceActors || self == .studios
    }
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .overview:
            "Overview"
        case .genres:
            "Genres"
        case .tags:
            "Tags"
        case .staff:
            "Staff"
        case .voiceActors:
            "Voice Actors"
        case .studios:
            "Studios"
        }
    }
}
