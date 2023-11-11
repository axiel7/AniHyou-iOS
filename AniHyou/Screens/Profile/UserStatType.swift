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
    //anime only
    case voiceActors
    case studios
}

extension UserStatType {
    var localizedName: LocalizedStringKey {
        switch self {
        case .overview:
            return "Overview"
        case .genres:
            return "Genres"
        case .tags:
            return "Tags"
        case .staff:
            return "Staff"
        case .voiceActors:
            return "Voice Actors"
        case .studios:
            return "Studios"
        }
    }
}
