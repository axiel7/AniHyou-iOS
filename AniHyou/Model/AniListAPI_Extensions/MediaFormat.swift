//
//  MediaFormat.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

@MainActor
extension MediaFormat {
    
    static let animeCases: [MediaFormat] = [.tv, .tvShort, .movie, .special, .ova, .ona, .music]
    static let mangaCases: [MediaFormat] = [.manga, .novel, .oneShot]
    
    static func allCases(mediaType: MediaType) -> [MediaFormat] {
        switch mediaType {
        case .anime:
            animeCases
        case .manga:
            mangaCases
        }
    }

    var localizedName: LocalizedStringKey {
        switch self {
        case .tv:
            "TV"
        case .tvShort:
            "TV Short"
        case .movie:
            "Movie"
        case .special:
            "Special"
        case .ova:
            "OVA"
        case .ona:
            "ONA"
        case .music:
            "Music"
        case .manga:
            "Manga"
        case .novel:
            "Novel"
        case .oneShot:
            "OneShot"
        }
    }

    var color: Color {
        switch self {
        case .tv:
            .accentColor
        case .tvShort:
            Color("Score90")
        case .movie:
            Color("Score100")
        case .special:
            Color("Score50")
        case .ova:
            Color("Score30")
        case .ona:
            Color("Score20")
        case .music:
            Color("Score60")
        case .manga:
            .accentColor
        case .novel:
            Color("Score90")
        case .oneShot:
            Color("Score70")
        }
    }
}
