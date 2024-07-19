//
//  AnimeThemes.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/07/2024.
//

import Foundation

struct AnimeThemes: Codable {
    let openingThemes: [Theme]?
    let endingThemes: [Theme]?
    
    struct Theme: Codable, Identifiable {
        let id: Int
        let text: String
    }
    
    enum CodingKeys: String, CodingKey {
        case openingThemes = "opening_themes"
        case endingThemes = "ending_themes"
    }
}

extension AnimeThemes.Theme {
    private var queryText: String {
        text
            .replacingOccurrences(of: " ", with: "+")
            .replacingOccurrences(of: "\"", with: "")
            .replacing(/#?\w+:/, maxReplacements: 1, with: { _ in "" }) // theme number
            .replacing(/(ep.*)/, with: { _ in "" }) // episodes
    }
    
    var youtubeUrl: URL {
        URL(string: YOUTUBE_QUERY_URL + queryText)!
    }
}
