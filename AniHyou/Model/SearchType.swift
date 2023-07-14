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
    var localizedName: String {
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

    var systemImage: String {
        switch self {
        case .anime:
            return "play.tv"
        case .manga:
            return "book"
        case .characters:
            return "face.smiling"
        case .staff:
            return "person.text.rectangle"
        case .studios:
            return "paintbrush.pointed"
        case .users:
            return "person"
        }
    }
}
