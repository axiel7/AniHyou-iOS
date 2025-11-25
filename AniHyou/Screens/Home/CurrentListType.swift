//
//  HomeListType.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/10/25.
//

import SwiftUI

enum CurrentListType: CaseIterable {
    case airing
    case behind
    case anime
    case manga
    case nextSeason
    
    var title: LocalizedStringKey {
        switch self {
        case .airing:
            "Airing"
        case .behind:
            "Anime Behind"
        case .anime:
            "Watching"
        case .manga:
            "Reading"
        case .nextSeason:
            "Next Season"
        }
    }
}
