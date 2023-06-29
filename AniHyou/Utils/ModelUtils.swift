//
//  ModelUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 04/10/2022.
//

import Foundation
import SwiftUI
import AniListAPI

extension MediaType {
    var localizedName: String {
        switch self {
        case .anime:
            return "Anime"
        case .manga:
            return "Manga"
        }
    }
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

extension ScoreFormat {
    
    func scoreColor(score: Double?) -> Color {
        guard score != 0 else { return .gray }
        switch self {
        case .point100:
            return Color("Score\(Int(round(score! / 10) * 10))")
        case .point10Decimal:
            return Color("Score\(Int(round(score!)) * 10)")
        case .point10:
            return Color("Score\(Int(score!) * 10)")
        case .point5:
            switch Int(score!) {
            case 1:
                return Color("Score10")
            case 2:
                return Color("Score30")
            case 3:
                return Color("Score50")
            case 4:
                return Color("Score80")
            case 5:
                return Color("Score100")
            default:
                return .gray
            }
        case .point3:
            switch Int(score!) {
            case 1:
                return .red
            case 2:
                return .yellow
            case 3:
                return .green
            default:
                return .gray
            }
        }
    }
    
    func smileyIcon(score: Int) -> String {
        switch score {
        case 1:
            return "sentiment.dissatisfied"
        case 2:
            return "sentiment.neutral"
        case 3:
            return "sentiment.satisfied"
        default:
            return ""
        }
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
        }
    }
    
    /// System symbol name representing this status
    var systemImage: String {
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
        }
    }
    
    var color: Color {
        switch self {
        case .current:
            return .blue
        case .planning:
            return .green
        case .completed:
            return .purple
        case .dropped:
            return .red
        case .paused:
            return .yellow
        case .repeating:
            return .blue
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
        }
    }
    
    var color: Color {
        switch self {
        case .tv:
            return .accentColor
        case .tvShort:
            return Color("Score90")
        case .movie:
            return Color("Score100")
        case .special:
            return Color("Score50")
        case .ova:
            return Color("Score30")
        case .ona:
            return Color("Score20")
        case .music:
            return Color("Score60")
        case .manga:
            return .accentColor
        case .novel:
            return Color("Score90")
        case .oneShot:
            return Color("Score70")
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
        }
    }
}

extension MediaRankType {
    
    var systemImage: String {
        switch self {
        case .rated:
            return "star"
        case .popular:
            return "heart"
        }
    }
    
    var color: Color {
        switch self {
        case .rated:
            return .yellow
        case .popular:
            return .pink
        }
    }
}

extension MediaDetailsQuery.Data.Media.ExternalLink {
    var displayName: String {
        if language != nil {
            return "\(site) (\(language!))"
        } else {
            return site
        }
    }
}

extension String {
    var profileHexColor: String {
        if self.hasPrefix("#") { return self }
        
        switch self {
        case "blue":
            return "#3DB4F2"
        case "purple":
            return "#C063FF"
        case "pink":
            return "#FC9DD6"
        case "orange":
            return "#EF881B"
        case "red":
            return "#E13433"
        case "green":
            return "#4DCA51"
        case "gray":
            return "#677B94"
        default:
            return "#3DB4F2"
        }
    }
}
