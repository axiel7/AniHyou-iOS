//
//  ExternalLink.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import AniListAPI

extension MediaDetailsQuery.Data.Media.ExternalLink {
    var displayName: String {
        var part1 = ""
        var part2 = ""
        if let languageShort {
            part1 = " (\(languageShort))"
        }
        if let notes {
            part2 = " (\(notes))"
        }
        return site + part1 + part2
    }
    
    var languageShort: String? {
        switch language {
        case "Japanese":
            "JP"
        case "English":
            "EN"
        default:
            language
        }
    }
}
