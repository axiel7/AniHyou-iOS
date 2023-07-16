//
//  NotificationTypeGrouped.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/06/2023.
//

import Foundation
import AniListAPI

public enum NotificationTypeGrouped: Equatable, Hashable, CaseIterable {
    case all
    case airing
    case activity
    case forum
    case follows
    case media

    var value: [NotificationType] {
        switch self {
        case .all:
            return []
        case .airing:
            return [.airing]
        case .activity:
            return [.activityLike, .activityReply, .activityReplyLike, .activityMention, .activityMessage,
                    .activityReplySubscribed]
        case .forum:
            return [.threadLike, .threadCommentReply, .threadCommentLike, .threadCommentMention, .threadSubscribed]
        case .follows:
            return [.following]
        case .media:
            return [.relatedMediaAddition, .mediaDataChange, .mediaMerge, .mediaDeletion]
        }
    }

    var localizedName: String {
        switch self {
        case .all:
            return "All"
        case .airing:
            return "Airing"
        case .activity:
            return "Activity"
        case .forum:
            return "Forum"
        case .follows:
            return "Follows"
        case .media:
            return "Media"
        }
    }
}
