//
//  SearchType.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/6/22.
//

import Foundation
import SwiftUI

public enum SearchType: Equatable, Hashable, CaseIterable {
    case anime
    case manga
    case characters
    case staff
    case studios
    case users
}

extension SearchType {
    var localizedName: LocalizedStringKey {
        switch self {
        case .anime:
            "Anime"
        case .manga:
            "Manga"
        case .characters:
            "Characters"
        case .staff:
            "Staff"
        case .studios:
            "Studios"
        case .users:
            "Users"
        }
    }

    var systemImage: String {
        switch self {
        case .anime:
            "play.tv"
        case .manga:
            "book"
        case .characters:
            "face.smiling"
        case .staff:
            "person.text.rectangle"
        case .studios:
            "paintbrush.pointed"
        case .users:
            "person"
        }
    }
}
