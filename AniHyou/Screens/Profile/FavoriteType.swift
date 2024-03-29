//
//  FavoriteType.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/03/2024.
//

import Foundation
import SwiftUI

enum FavoriteType: Hashable, CaseIterable {
    case anime
    case manga
    case characters
    case staff
    case studios
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .anime:
            return "Anime"
        case .manga:
            return "Manga"
        case .characters:
            return "Characters"
        case .staff:
            return "Staff"
        case .studios:
            return "Studios"
        }
    }
}
