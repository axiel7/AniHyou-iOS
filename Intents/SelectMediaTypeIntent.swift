//
//  SelectMediaTypeIntent.swift
//  AniHyou WidgetExtension
//
//  Created by Axel Lopez on 20/09/2023.
//

import Foundation
import AppIntents
import AniListAPI

// We need to create a new enum because we can't conform to AppEnum,
// it needs to be in the same file and MediaType is an auto-generated type by Apollo so we can't edit it
enum MediaTypeAppEnum: String, AppEnum {
    case anime = "ANIME"
    case manga = "MANGA"
    
    var value: MediaType {
        switch self {
        case .anime:
            return .anime
        case .manga:
            return .manga
        }
    }
    
    init(mediaType: MediaType) {
        switch mediaType {
        case .anime:
            self = .anime
        case .manga:
            self = .manga
        }
    }
    
    public static var typeDisplayRepresentation = TypeDisplayRepresentation(stringLiteral: "Media Type")
    
    public static var caseDisplayRepresentations: [MediaTypeAppEnum: DisplayRepresentation] = [
        .anime: "Anime",
        .manga: "Manga"
    ]
}

struct SelectMediaTypeIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Select Media Type"
    static var description = IntentDescription("Choose between Anime or Manga.")
    
    @Parameter(title: "Media Type", default: MediaTypeAppEnum.anime)
    var mediaType: MediaTypeAppEnum
    
    init(mediaType: MediaType) {
        self.mediaType = MediaTypeAppEnum(mediaType: mediaType)
    }
    
    init() {}
}
