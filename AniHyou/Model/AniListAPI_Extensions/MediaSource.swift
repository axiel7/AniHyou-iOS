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
            "Original"
        case .manga:
            "Manga"
        case .lightNovel:
            "Light novel"
        case .visualNovel:
            "Visual novel"
        case .videoGame:
            "VideoGame"
        case .other:
            "Other"
        case .novel:
            "Novel"
        case .doujinshi:
            "Doujinshi"
        case .anime:
            "Anime"
        case .webNovel:
            "Web novel"
        case .liveAction:
            "Live action"
        case .game:
            "Game"
        case .comic:
            "Comic"
        case .multimediaProject:
            "Multimedia project"
        case .pictureBook:
            "Picture book"
        }
    }
}
