//
//  NotificationTypeGrouped.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/06/2023.
//

import SwiftUI
import AniListAPI

public enum NotificationTypeGrouped: Equatable, Hashable, CaseIterable, Sendable {
    case all
    case airing
    case activity
    case forum
    case follows
    case media

    var value: [NotificationType] {
        switch self {
        case .all:
            []
        case .airing:
            [.airing]
        case .activity:
            [.activityLike, .activityReply, .activityReplyLike, .activityMention, .activityMessage,
                    .activityReplySubscribed]
        case .forum:
            [.threadLike, .threadCommentReply, .threadCommentLike, .threadCommentMention, .threadSubscribed]
        case .follows:
            [.following]
        case .media:
            [.relatedMediaAddition, .mediaDataChange, .mediaMerge, .mediaDeletion]
        }
    }

    var localizedName: LocalizedStringKey {
        switch self {
        case .all:
            "All"
        case .airing:
            "Airing"
        case .activity:
            "Activity"
        case .forum:
            "Forum"
        case .follows:
            "Follows"
        case .media:
            "Media"
        }
    }
}
