//
//  StringUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation

extension String {
    
    var htmlStripped: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}

extension Int {
    
    var stringValue: String {
        return "\(self)"
    }
}

extension MediaListStatus {
    
    var localizedName: String {
        switch self {
        case .current:
            return "Current"
        case .completed:
            return "Completed"
        case .paused:
            return "Paused"
        case .planning:
            return "Planning"
        case .dropped:
            return "Dropped"
        case .repeating:
            return "Repeating"
        default:
            return "Unknown"
        }
    }
    
    /// System symbol name representing this status
    var systemIcon: String {
        switch self {
        case .current:
            return "play.circle"
        case .completed:
            return "checkmark.circle"
        case .paused:
            return "pause.circle"
        case .planning:
            return "clock"
        case .dropped:
            return "trash"
        case .repeating:
            return "repeat"
        default:
            return "questionmark.circle"
        }
    }
}

extension MediaSeason {
    
    var localizedName: String {
        switch self {
        case .winter:
            return "Winter"
        case .spring:
            return "Spring"
        case .summer:
            return "Summer"
        case .fall:
            return "Fall"
        default:
            return "Spring"
        }
    }
}

extension MediaFormat {
    
    var localizedName: String {
        switch self {
        case .tv:
            return "TV"
        case .tvShort:
            return "TV Short"
        case .movie:
            return "Movie"
        case .special:
            return "Special"
        case .ova:
            return "OVA"
        case .ona:
            return "ONA"
        case .music:
            return "Music"
        case .manga:
            return "Manga"
        case .novel:
            return "Novel"
        case .oneShot:
            return "OneShot"
        case .__unknown(let rawValue):
            return rawValue
        }
    }
}

extension MediaStatus {
    
    var localizedName: String {
        switch self {
        case .finished:
            return "Finished"
        case .releasing:
            return "Releasing"
        case .notYetReleased:
            return "Unreleased"
        case .cancelled:
            return "Cancelled"
        case .hiatus:
            return "Hiatus"
        case .__unknown(let rawValue):
            return rawValue
        }
    }
}

extension MediaSource {
    
    var localizedName: String {
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
        case .__unknown(let rawValue):
            return rawValue
        }
    }
}

extension CharacterRole {
    
    var localizedName: String {
        switch self {
        case .main:
            return "Main"
        case .supporting:
            return "Supporting"
        case .background:
            return "Background"
        case .__unknown(let rawValue):
            return rawValue
        }
    }
}

extension MediaRelation {
    
    var localizedName: String {
        switch self {
        case .adaptation:
            return "Adaptation"
        case .prequel:
            return "Prequel"
        case .sequel:
            return "Sequel"
        case .parent:
            return "Parent"
        case .sideStory:
            return "Side Story"
        case .character:
            return "Character"
        case .summary:
            return "Summary"
        case .alternative:
            return "Alternative"
        case .spinOff:
            return "Spin Off"
        case .other:
            return "Other"
        case .source:
            return "Source"
        case .compilation:
            return "Compilation"
        case .contains:
            return "Contains"
        case .__unknown(let rawValue):
            return rawValue
        }
    }
}

extension MediaListSort {
    
    var localizedName: String {
        switch self {
        case .mediaId:
            return "Id"
        case .mediaIdDesc:
            return "Id"
        case .score:
            return "Score"
        case .scoreDesc:
            return "Score"
        case .status:
            return "Status"
        case .statusDesc:
            return "Status"
        case .progress:
            return "Progress"
        case .progressDesc:
            return "Progress"
        case .progressVolumes:
            return "Progress"
        case .progressVolumesDesc:
            return "progress"
        case .repeat:
            return "Repeat"
        case .repeatDesc:
            return "Repeat"
        case .priority:
            return "Priority"
        case .priorityDesc:
            return "Priority"
        case .startedOn:
            return "Started"
        case .startedOnDesc:
            return "Started"
        case .finishedOn:
            return "Finished"
        case .finishedOnDesc:
            return "Finished"
        case .addedTime:
            return "Added"
        case .addedTimeDesc:
            return "Last Added"
        case .updatedTime:
            return "Updated"
        case .updatedTimeDesc:
            return "Last Updated"
        case .mediaTitleRomaji:
            return "Title"
        case .mediaTitleRomajiDesc:
            return "Title"
        case .mediaTitleEnglish:
            return "Title"
        case .mediaTitleEnglishDesc:
            return "Title"
        case .mediaTitleNative:
            return "Title"
        case .mediaTitleNativeDesc:
            return "Title"
        case .mediaPopularity:
            return "Popularity"
        case .mediaPopularityDesc:
            return "Popularity"
        case .__unknown(let rawValue):
            return rawValue
        }
    }
}
