//
//  DiscoverTab.swift
//  AniHyou
//
//  Created by Axel on 26/08/2026.
//

import Foundation
import SwiftUI

enum DiscoverTab: Int, CaseIterable {
    case anime = 0
    case manga = 1
}

extension DiscoverTab {
    var localizedName: LocalizedStringKey {
        switch self {
        case .anime:
            "Anime"
        case .manga:
            "Manga"
        }
    }
    
    var systemImage: String {
        switch self {
        case .anime:
            "play.tv"
        case .manga:
            "book"
        }
    }
}
