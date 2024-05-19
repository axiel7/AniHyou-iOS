//
//  SetProgress.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/09/2023.
//

import Foundation
import AppIntents
import AniListAPI

// TODO: create an enum that conforms to AppEnum
/*extension MediaListStatus: AppEnum, @unchecked Sendable {
    public static var typeDisplayRepresentation = TypeDisplayRepresentation(stringLiteral: "List Status")
    
    public static var caseDisplayRepresentations: [MediaListStatus : DisplayRepresentation] =
    Dictionary(grouping: MediaListStatus.allCases, by: { $0 })
        .mapValues { DisplayRepresentation(stringLiteral: $0.last!.localizedName) }
    
}*/

struct SetProgressIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Set progress"
    static var description = IntentDescription("Sets a list entry progress to the specified number.")

    @Parameter(title: "Media ID", description: "The id of the media the entry is of")
    var mediaId: Int
    
    @Parameter(title: "List entry ID")
    var entryId: Int
    
    @Parameter(title: "Progress", description: "The amount of episodes/chapters consumed by the user")
    var progress: Int
    
    @Parameter(title: "Status", description: "Optional status to update the list entry to (e.g. COMPLETED)")
    var status: String?

    init() {}

    init(mediaId: Int, entryId: Int, progress: Int, status: MediaListStatus.RawValue? = nil) {
        self.mediaId = mediaId
        self.entryId = entryId
        self.progress = progress
        self.status = status
    }
    
    func perform() async throws -> some IntentResult & ReturnsValue<Bool> {
        if let entry = await MediaListRepository.updateProgress(
            entryId: entryId,
            progress: progress,
            status: MediaListStatus(rawValue: status ?? "")
        ) {
            let _: CommonMediaListEntry? = await MediaListRepository.updateCachedEntry(entry)
            return .result(value: true)
        } else {
            return .result(value: false)
        }
    }
}
