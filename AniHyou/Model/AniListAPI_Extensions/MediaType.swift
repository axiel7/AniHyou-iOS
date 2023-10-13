//
//  MediaType.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension MediaType {
    var localizedName: LocalizedStringKey {
        switch self {
        case .anime:
            return "Anime"
        case .manga:
            return "Manga"
        }
    }

    var mediaUrl: String {
        switch self {
        case .anime:
            return ANILIST_ANIME_URL
        case .manga:
            return ANILIST_MANGA_URL
        }
    }
}
