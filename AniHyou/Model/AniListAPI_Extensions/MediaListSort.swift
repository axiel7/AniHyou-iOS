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
    
    static var allCasesForUi: [MediaListSort] {
        return [.mediaTitleRomajiDesc, .scoreDesc, .progressDesc, .updatedTimeDesc, .addedTimeDesc, .startedOnDesc,
            .finishedOnDesc, .repeatDesc, .mediaPopularityDesc]
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
    // swiftlint:disable:next cyclomatic_complexity
    func toAscending() -> MediaListSort {
        switch self {
        case .mediaIdDesc:
            return .mediaId
        case .scoreDesc:
            return .score
        case .statusDesc:
            return .status
        case .progressDesc:
            return .progress
        case .progressVolumesDesc:
            return .progressVolumes
        case .repeatDesc:
            return .repeat
        case .priorityDesc:
            return .priority
        case .startedOnDesc:
            return .startedOn
        case .finishedOnDesc:
            return .finishedOn
        case .addedTimeDesc:
            return .addedTime
        case .updatedTimeDesc:
            return .updatedTime
        case .mediaTitleRomajiDesc:
            return .mediaTitleRomaji
        case .mediaTitleEnglishDesc:
            return .mediaTitleEnglish
        case .mediaTitleNativeDesc:
            return .mediaTitleNative
        case .mediaPopularityDesc:
            return .mediaPopularity
        default:
            return self
        }
    }
    
    static func titleSortForLanguage(_ lang: UserTitleLanguage) -> MediaListSort {
        switch lang {
        case .romaji, .romajiStylised:
            return .mediaTitleRomajiDesc
        case .english, .englishStylised:
            return .mediaTitleEnglishDesc
        case .native, .nativeStylised:
            return .mediaTitleNativeDesc
        }
    }
}
