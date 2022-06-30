//
//  SearchType.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/6/22.
//

import Foundation

public enum SearchType: Equatable, Hashable, CaseIterable {
    case anime
    case manga
    case characters
    case staff
    case studios
    case users
}

extension SearchType {
    var formatted: String {
        switch self {
        case .anime:
            return "Anime"
        case .manga:
            return "Manga"
        case .characters:
            return "Characters"
        case .staff:
            return "Staff"
        case .studios:
            return "Studios"
        case .users:
            return "Users"
        }
    }
}
