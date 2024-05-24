//
//  NotificationItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/02/2023.
//

import SwiftUI
import NukeUI

struct NotificationItemView: View {

    let notification: GenericNotification
    private let imageWidth: CGFloat = 50
    private let imageHeight: CGFloat = 50

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                LazyImage(url: URL(string: notification.imageUrl ?? "")) { state in
                    if let image = state.image {
                        image
                            .imageCover(width: imageWidth, height: imageHeight)
                    } else {
                        CoverPlaceholderView(systemName: "hourglass", width: imageWidth, height: imageHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }

                Text(notification.text)
                    .lineLimit(2)
            }//:HStack
        }
    }

    @ViewBuilder
    var destination: some View {
        if let contentId = notification.contentId {
            switch notification.type {
            case .airing, .relatedMediaAddition, .mediaDataChange, .mediaMerge:
                MediaDetailsView(mediaId: contentId)
            case .following:
                ProfileView(userId: contentId)
            case .activityMessage, .activityMention, .activityReply, .activityReplySubscribed, .activityLike,
                    .activityReplyLike:
                ActivityDetailsView(activityId: contentId)
            case .threadCommentMention, .threadCommentReply, .threadSubscribed, .threadCommentLike, .threadLike:
                ThreadDetailsView(threadId: contentId)
            default:
                Text(notification.text)
            }
        } else { Text(notification.text) }
    }
}

#Preview {
    let notification = GenericNotification(
        id: 1,
        text: "Episode 7 of Shingeki no Kyojin: The Final Season Part 2 aired.",
        imageUrl: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx131681-ODIRpBIbR5Eu.jpg",
        contentId: 1,
        type: .airing,
        createdAt: 109120128
    )
    return NotificationItemView(notification: notification)
}
