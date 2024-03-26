//
//  GenericNotification.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/02/2023.
//

import Foundation
import AniListAPI

struct GenericNotification: Identifiable {
    let id: Int
    let text: String
    let imageUrl: String?
    let contentId: Int?
    let type: NotificationType
    let createdAt: Int
}

extension NotificationsQuery.Data.Page.Notification {

    // swiftlint:disable:next cyclomatic_complexity function_body_length
    func toGenericNotification() -> GenericNotification? {
        if let noti = self.asAiringNotification {
            let episodeString = noti.contexts.flatMap { $0[0] } ?? ""
            let ofString = noti.contexts.flatMap { $0[1] } ?? ""
            let airedString = noti.contexts.flatMap { $0[2] } ?? ""
            let text =
                "\(episodeString)\(noti.episode)\(ofString)\(noti.media?.title?.userPreferred ?? "")\(airedString)"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.media?.coverImage?.medium,
                contentId: noti.animeId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asFollowingNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                contentId: noti.userId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asActivityMessageNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                contentId: noti.activityId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asActivityMentionNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text, imageUrl: noti.user?.avatar?.medium,
                contentId: noti.activityId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asActivityReplyNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                contentId: noti.activityId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asActivityReplySubscribedNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                contentId: noti.activityId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asActivityLikeNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                contentId: noti.activityId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asActivityReplyLikeNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                contentId: noti.activityId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asThreadCommentMentionNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                //contentId: noti.commentId, TODO: link to the comment directly
                contentId: noti.thread?.id,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asThreadCommentReplyNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                //contentId: noti.commentId,
                contentId: noti.thread?.id,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asThreadCommentSubscribedNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                //contentId: noti.commentId,
                contentId: noti.thread?.id,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asThreadCommentLikeNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                //contentId: noti.commentId,
                contentId: noti.thread?.id,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asThreadLikeNotification {
            let text = "\(noti.user?.name ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.user?.avatar?.medium,
                contentId: noti.threadId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asRelatedMediaAdditionNotification {
            let text = "\(noti.media?.title?.userPreferred ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.media?.coverImage?.medium,
                contentId: noti.mediaId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asMediaDataChangeNotification {
            let text = "\(noti.media?.title?.userPreferred ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.media?.coverImage?.medium,
                contentId: noti.mediaId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asMediaMergeNotification {
            let text = "\(noti.media?.title?.userPreferred ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: noti.media?.coverImage?.medium,
                contentId: noti.mediaId,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        } else if let noti = self.asMediaDeletionNotification {
            let text = "\(noti.deletedMediaTitle ?? "")\(noti.context ?? "")"
            return GenericNotification(
                id: noti.id,
                text: text,
                imageUrl: nil,
                contentId: 0,
                type: noti.type!.value!,
                createdAt: noti.createdAt ?? 0
            )
        }
        return nil
    }
}
