//
//  ExternalLink.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import AniListAPI

extension MediaDetailsQuery.Data.Media.ExternalLink {
    var displayName: String {
        if let languageShort {
            return "\(site) (\(languageShort))"
        } else {
            return site
        }
    }
    
    var languageShort: String? {
        switch language {
        case "Japanese":
            return "JP"
        case "English":
            return "EN"
        default:
            return language
        }
    }
}
