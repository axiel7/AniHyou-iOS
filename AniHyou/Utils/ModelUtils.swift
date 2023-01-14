//
//  ModelUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 04/10/2022.
//

import Foundation
import SwiftUI
import API

var MediaListStatusAllCases: [MediaListStatus] {
    return [MediaListStatus.current, MediaListStatus.planning, MediaListStatus.completed, MediaListStatus.dropped, MediaListStatus.paused, MediaListStatus.repeating]
}

extension UserMediaListQuery.Data.Page.MediaList {
    var totalProgress: Int? {
        if self.media?.type?.value == .anime {
            return self.media?.episodes
        } else {
            return self.media?.chapters
        }
    }
    
    var coverColorWithAlpha: Color? {
        if let color = self.media?.coverImage?.color {
            return Color(color + "88")
        } else { return nil }
    }
}
