//
//  MainTabs.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/09/2023.
//

import Foundation
import SwiftUI

enum MainTab: Int {
    case home = 0
    case anime = 1
    case manga = 2
    case profile = 3
    case explore = 4
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .home:
            return "Home"
        case .anime:
            return "Anime"
        case .manga:
            return "Manga"
        case .profile:
            return "Profile"
        case .explore:
            return "Explore"
        }
    }
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .anime:
            return "play.tv"
        case .manga:
            return "book"
        case .profile:
            return "person"
        case .explore:
            return "magnifyingglass"
        }
    }
}
