//
//  ActivityReplyItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/10/2023.
//

import SwiftUI
import MarkdownUI
import AniListAPI

struct ActivityReplyItemView: View {
    
    let reply: ActivityReplyFragment
    @State var isLiked: Bool
    @State var likeCount: Int
    
    init(reply: ActivityReplyFragment) {
        self.reply = reply
        self.isLiked = reply.isLiked == true
        self.likeCount = reply.likeCount
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NavigationLink(destination: ProfileView(userId: reply.userId ?? 0)) {
                    HStack(alignment: .center) {
                        CircleImageView(imageUrl: reply.user?.avatar?.medium, size: 24)
                        
                        Text(reply.user?.name ?? "Loading")
                            .bold()
                            .font(.subheadline)
                            .padding(.bottom, 1)
                    }
                }
                .foregroundStyle(.primary)
                Spacer()
                let createdAt = Date(timeIntervalSince1970: Double(reply.createdAt))
                Text("\(createdAt, format: .relative(presentation: .numeric))")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom, 1)
            }//:HStack
            
            Markdown(reply.text?.formatMarkdown() ?? "Loading")
                .defaultStyle()
            
            HStack {
                Spacer()
                Button(
                    action: {
                        Task {
                            if let likeResult = await LikeRepository.toggleLike(
                                likeableId: reply.id,
                                likeableType: .activityReply
                            ) {
                                isLiked = likeResult
                                if likeResult {
                                    likeCount += 1
                                } else {
                                    likeCount -= 1
                                }
                            }
                        }
                    }
                ) {
                    Label("\(likeCount)",
                          systemImage: isLiked ? "heart.fill" : "heart"
                    )
                }
                .frame(width: 60, alignment: .leading)
            }//:HStack
            .padding(.top, 4)
        }//:VStack
        .padding(.horizontal)
        .padding(.vertical, 1)
    }
}

/*#Preview {
    ActivityReplyItemView()
}*/
