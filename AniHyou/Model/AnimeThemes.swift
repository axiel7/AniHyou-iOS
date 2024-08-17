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

enum MusicStreaming: CaseIterable {
    case youtube
    case spotify
    case appleMusic
    case youtubeMusic
    case deezer
    
    var name: String {
        switch self {
        case .youtube:
            "YouTube"
        case .spotify:
            "Spotify"
        case .appleMusic:
            "Apple Music"
        case .youtubeMusic:
            "YouTube Music"
        case .deezer:
            "Deezer"
        }
    }
    
    var searchUrl: String {
        switch self {
        case .youtube:
            "https://www.youtube.com/results?search_query="
        case .spotify:
            "https://open.spotify.com/search/"
        case .appleMusic:
            "https://music.apple.com/search?term="
        case .youtubeMusic:
            "https://music.youtube.com/search?q="
        case .deezer:
            "https://www.deezer.com/search/"
        }
    }
}

extension AnimeThemes.Theme {
    var queryText: String {
        text
            .replacingOccurrences(of: "\"", with: "")
            .replacing(/#?\w+:/, maxReplacements: 1, with: { _ in "" }) // theme number
            .replacing(/(ep.*)/, with: { _ in "" }) // episodes
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}
