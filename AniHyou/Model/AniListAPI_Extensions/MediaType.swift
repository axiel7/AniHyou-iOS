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
            "Anime"
        case .manga:
            "Manga"
        }
    }

    var mediaUrl: String {
        switch self {
        case .anime:
            ANILIST_ANIME_URL
        case .manga:
            ANILIST_MANGA_URL
        }
    }
    
    var customListsKey: String {
        switch self {
        case .anime:
            ANIME_CUSTOM_LISTS_KEY
        case .manga:
            MANGA_CUSTOM_LISTS_KEY
        }
    }
}
