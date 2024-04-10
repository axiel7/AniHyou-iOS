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
            "Anime"
        case .manga:
            "Manga"
        case .characters:
            "Characters"
        case .staff:
            "Staff"
        case .studios:
            "Studios"
        }
    }
}
