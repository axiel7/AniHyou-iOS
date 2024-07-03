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
            "Id"
        case .score, .scoreDesc:
            "Score"
        case .status, .statusDesc:
            "Status"
        case .progress, .progressDesc:
            "Progress"
        case .progressVolumes, .progressVolumesDesc:
            "Progress"
        case .repeat, .repeatDesc:
            "Repeat"
        case .priority, .priorityDesc:
            "Priority"
        case .startedOn, .startedOnDesc:
            "Started"
        case .finishedOn, .finishedOnDesc:
            "Finished"
        case .addedTime:
            "Added"
        case .addedTimeDesc:
            "Last Added"
        case .updatedTime:
            "Updated"
        case .updatedTimeDesc:
            "Last Updated"
        case .mediaTitleRomaji, .mediaTitleRomajiDesc:
            "Title"
        case .mediaTitleEnglish, .mediaTitleEnglishDesc:
            "Title"
        case .mediaTitleNative, .mediaTitleNativeDesc:
            "Title"
        case .mediaPopularity, .mediaPopularityDesc:
            "Popularity"
        }
    }
    
    static var allCasesForUi: [MediaListSort] {
        [.mediaTitleRomajiDesc, .scoreDesc, .progressDesc, .updatedTimeDesc, .addedTimeDesc, .startedOnDesc,
            .finishedOnDesc, .repeatDesc]
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
    
    var isTitle: Bool {
        switch self {
        case .mediaTitleNative, .mediaTitleNativeDesc, .mediaTitleRomaji, .mediaTitleRomajiDesc, 
                .mediaTitleEnglish, .mediaTitleEnglishDesc:
            return true
        default:
            return false
        }
    }
    
    // swiftlint:disable:next cyclomatic_complexity
    func toAscending() -> MediaListSort {
        switch self {
        case .mediaIdDesc:
            .mediaId
        case .scoreDesc:
            .score
        case .statusDesc:
            .status
        case .progressDesc:
            .progress
        case .progressVolumesDesc:
            .progressVolumes
        case .repeatDesc:
            .repeat
        case .priorityDesc:
            .priority
        case .startedOnDesc:
            .startedOn
        case .finishedOnDesc:
            .finishedOn
        case .addedTimeDesc:
            .addedTime
        case .updatedTimeDesc:
            .updatedTime
        case .mediaTitleRomajiDesc:
            .mediaTitleRomaji
        case .mediaTitleEnglishDesc:
            .mediaTitleEnglish
        case .mediaTitleNativeDesc:
            .mediaTitleNative
        case .mediaPopularityDesc:
            .mediaPopularity
        default:
            self
        }
    }
    
    static func titleSortForLanguage(_ lang: UserTitleLanguage) -> MediaListSort {
        switch lang {
        case .romaji, .romajiStylised:
            .mediaTitleRomajiDesc
        case .english, .englishStylised:
            .mediaTitleEnglishDesc
        case .native, .nativeStylised:
            .mediaTitleNativeDesc
        }
    }
}
