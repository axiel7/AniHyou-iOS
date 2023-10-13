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
            return "Action"
        case "Adventure":
            return "Adventure"
        case "Comedy":
            return "Comedy"
        case "Drama":
            return "Drama"
        case "Ecchi":
            return "Ecchi"
        case "Fantasy":
            return "Fantasy"
        case "Hentai":
            return "Hentai"
        case "Horror":
            return "Horror"
        case "Mahou Shoujo":
            return "Mahou Shoujo"
        case "Mecha":
            return "Mecha"
        case "Music":
            return "Music"
        case "Mystery":
            return "Mystery"
        case "Psychological":
            return "Psychological"
        case "Romance":
            return "Romance"
        case "Sci-Fi":
            return "Sci-Fi"
        case "Slice of Life":
            return "Slice of Life"
        case "Sports":
            return "Sports"
        case "Supernatural":
            return "Supernatural"
        case "Thriller":
            return "Thriller"
        default:
            return nil
        }
    }
}
