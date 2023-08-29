//
//  ExternalLink.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import AniListAPI

extension MediaDetailsQuery.Data.Media.ExternalLink {
    var displayName: String {
        if language != nil {
            return "\(site) (\(language!))"
        } else {
            return site
        }
    }
}
