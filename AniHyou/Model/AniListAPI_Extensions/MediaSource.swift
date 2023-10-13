//
//  MediaSource.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension MediaSource {

    var localizedName: LocalizedStringKey {
        switch self {
        case .original:
            return "Original"
        case .manga:
            return "Manga"
        case .lightNovel:
            return "Light novel"
        case .visualNovel:
            return "Visual novel"
        case .videoGame:
            return "VideoGame"
        case .other:
            return "Other"
        case .novel:
            return "Novel"
        case .doujinshi:
            return "Doujinshi"
        case .anime:
            return "Anime"
        case .webNovel:
            return "Web novel"
        case .liveAction:
            return "Live action"
        case .game:
            return "Game"
        case .comic:
            return "Comic"
        case .multimediaProject:
            return "Multimedia project"
        case .pictureBook:
            return "Picture book"
        }
    }
}
