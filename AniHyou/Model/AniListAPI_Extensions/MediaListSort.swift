//
//  MediaListSort.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension MediaListSort {

    var localizedName: LocalizedStringKey {
        switch self {
        case .mediaId, .mediaIdDesc:
            return "Id"
        case .score, .scoreDesc:
            return "Score"
        case .status, .statusDesc:
            return "Status"
        case .progress, .progressDesc:
            return "Progress"
        case .progressVolumes, .progressVolumesDesc:
            return "Progress"
        case .repeat, .repeatDesc:
            return "Repeat"
        case .priority, .priorityDesc:
            return "Priority"
        case .startedOn, .startedOnDesc:
            return "Started"
        case .finishedOn, .finishedOnDesc:
            return "Finished"
        case .addedTime:
            return "Added"
        case .addedTimeDesc:
            return "Last Added"
        case .updatedTime:
            return "Updated"
        case .updatedTimeDesc:
            return "Last Updated"
        case .mediaTitleRomaji, .mediaTitleRomajiDesc:
            return "Title"
        case .mediaTitleEnglish, .mediaTitleEnglishDesc:
            return "Title"
        case .mediaTitleNative, .mediaTitleNativeDesc:
            return "Title"
        case .mediaPopularity, .mediaPopularityDesc:
            return "Popularity"
        }
    }
    
    var isDesc: Bool {
        switch self {
        case .mediaIdDesc, .scoreDesc, .statusDesc, .progressDesc, .progressVolumesDesc, .repeatDesc, 
                .priorityDesc, .startedOnDesc, .finishedOnDesc, .addedTimeDesc, .updatedTimeDesc,
                .mediaTitleRomajiDesc, .mediaTitleEnglishDesc, .mediaTitleNativeDesc, .mediaPopularityDesc:
            return true
        default:
            return false
        }
    }
}
