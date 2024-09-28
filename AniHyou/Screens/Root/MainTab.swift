//
//  MainTabs.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/09/2023.
//

import Foundation
import SwiftUI

enum MainTab: Int, CaseIterable, Identifiable {
    case home = 0
    case anime = 1
    case manga = 2
    case profile = 3
    case explore = 4
    
    var id: Int {
        self.rawValue
    }
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .home:
            "Home"
        case .anime:
            "Anime"
        case .manga:
            "Manga"
        case .profile:
            "Profile"
        case .explore:
            "Explore"
        }
    }
    
    var systemImage: String {
        switch self {
        case .home:
            "house"
        case .anime:
            "play.tv"
        case .manga:
            "book"
        case .profile:
            "person"
        case .explore:
            "magnifyingglass"
        }
    }
}
