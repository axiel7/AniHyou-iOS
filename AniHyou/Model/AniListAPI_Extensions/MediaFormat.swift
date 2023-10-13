//
//  MediaFormat.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension MediaFormat {

    var localizedName: LocalizedStringKey {
        switch self {
        case .tv:
            return "TV"
        case .tvShort:
            return "TV Short"
        case .movie:
            return "Movie"
        case .special:
            return "Special"
        case .ova:
            return "OVA"
        case .ona:
            return "ONA"
        case .music:
            return "Music"
        case .manga:
            return "Manga"
        case .novel:
            return "Novel"
        case .oneShot:
            return "OneShot"
        }
    }

    var color: Color {
        switch self {
        case .tv:
            return .accentColor
        case .tvShort:
            return Color("Score90")
        case .movie:
            return Color("Score100")
        case .special:
            return Color("Score50")
        case .ova:
            return Color("Score30")
        case .ona:
            return Color("Score20")
        case .music:
            return Color("Score60")
        case .manga:
            return .accentColor
        case .novel:
            return Color("Score90")
        case .oneShot:
            return Color("Score70")
        }
    }
}
