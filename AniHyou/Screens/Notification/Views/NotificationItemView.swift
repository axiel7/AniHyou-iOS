//
//  NotificationItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/02/2023.
//

import SwiftUI
import Kingfisher

struct NotificationItemView: View {
    
    var notification: GenericNotification
    private let imageWidth: CGFloat = 50
    private let imageHeight: CGFloat = 50
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                KFImage(URL(string: notification.imageUrl ?? ""))
                    .placeholder {
                        CoverPlaceholderView(systemName: "hourglass", width: imageWidth, height: imageHeight)
                    }
                    .imageCover(width: imageWidth, height: imageHeight)
                
                Text(notification.text)
                    .lineLimit(2)
            }//:HStack
        }
    }
    
    @ViewBuilder
    var destination: some View {
        if notification.contentId != nil {
            switch notification.type {
            case .airing, .relatedMediaAddition, .mediaDataChange, .mediaMerge:
                MediaDetailsView(mediaId: notification.contentId!)
            case .following:
                ProfileView(userId: notification.contentId!)
            case .activityMessage, .activityMention, .activityReply, .activityReplySubscribed, .activityLike, .activityReplyLike:
                Text("Coming Soon")
            case .threadCommentMention, .threadCommentReply, .threadSubscribed, .threadCommentLike, .threadLike:
                Text("Coming Soon")
            default:
                Text(notification.text)
            }
        }
        else { Text(notification.text) }
    }
}

struct NotificationItemView_Previews: PreviewProvider {
    static var previews: some View {
        let notification = GenericNotification(id: 1, text: "Episode 7 of Shingeki no Kyojin: The Final Season Part 2 aired.", imageUrl: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/bx131681-ODIRpBIbR5Eu.jpg", contentId: 1, type: .airing, createdAt: 109120128)
        NotificationItemView(notification: notification)
    }
}
