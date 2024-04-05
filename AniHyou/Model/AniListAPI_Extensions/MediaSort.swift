//
//  MediaSort.swift
//  AniHyou
//
//  Created by Axel Lopez on 05/04/2024.
//

import Foundation
import SwiftUI
import AniListAPI

extension MediaSort {
    var localizedName: LocalizedStringKey {
        switch self {
        case .id:
            "Id"
        case .idDesc:
            "Id"
        case .titleRomaji:
            "Title"
        case .titleRomajiDesc:
            "Title"
        case .titleEnglish:
            "Title"
        case .titleEnglishDesc:
            "Title"
        case .titleNative:
            "Title"
        case .titleNativeDesc:
            "Title"
        case .type:
            "Media Type"
        case .typeDesc:
            "Media Type"
        case .format:
            "Format"
        case .formatDesc:
            "Format"
        case .startDate:
            "Release Date"
        case .startDateDesc:
            "Release Date"
        case .endDate:
            "End date"
        case .endDateDesc:
            "End date"
        case .score:
            "Score"
        case .scoreDesc:
            "Score"
        case .popularity:
            "Popularity"
        case .popularityDesc:
            "Popularity"
        case .trending:
            "Trending"
        case .trendingDesc:
            "Trending"
        case .episodes:
            "Episodes"
        case .episodesDesc:
            "Episodes"
        case .duration:
            "Duration"
        case .durationDesc:
            "Duartion"
        case .status:
            "Status"
        case .statusDesc:
            "Status"
        case .chapters:
            "Chapters"
        case .chaptersDesc:
            "Chapetrs"
        case .volumes:
            "Volumes"
        case .volumesDesc:
            "Volumes"
        case .updatedAt:
            "Updated"
        case .updatedAtDesc:
            "Updated"
        case .searchMatch:
            "Default"
        case .favourites:
            "Favorites"
        case .favouritesDesc:
            "Favorites"
        }
    }
}
