//
//  Genre.swift
//  AniHyou
//
//  Created by Axel Lopez on 05/01/2023.
//

import Foundation
import SwiftUI

// Workaround: SwiftUI List item selection only works on Identifiable objects
struct Genre: Identifiable {
    let id: String
}

extension String {
    // this is required so Xcode exports these strings for localization
    var genreLocalized: LocalizedStringKey? {
        switch self {
        case "Action":
            "Action"
        case "Adventure":
            "Adventure"
        case "Comedy":
            "Comedy"
        case "Drama":
            "Drama"
        case "Ecchi":
            "Ecchi"
        case "Fantasy":
            "Fantasy"
        case "Hentai":
            "Hentai"
        case "Horror":
            "Horror"
        case "Mahou Shoujo":
            "Mahou Shoujo"
        case "Mecha":
            "Mecha"
        case "Music":
            "Music"
        case "Mystery":
            "Mystery"
        case "Psychological":
            "Psychological"
        case "Romance":
            "Romance"
        case "Sci-Fi":
            "Sci-Fi"
        case "Slice of Life":
            "Slice of Life"
        case "Sports":
            "Sports"
        case "Supernatural":
            "Supernatural"
        case "Thriller":
            "Thriller"
        default:
            nil
        }
    }
}
