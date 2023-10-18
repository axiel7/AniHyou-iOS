//
//  MessageActivityItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/10/2023.
//

import SwiftUI
import MarkdownUI
import AniListAPI

struct MessageActivityItemView: View {
    
    let activity: MessageActivityFragment
    @State var isLiked: Bool
    @State var likeCount: Int
    
    init(activity: MessageActivityFragment) {
        self.activity = activity
        self.isLiked = activity.isLiked == true
        self.likeCount = activity.likeCount
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NavigationLink(destination: ProfileView(userId: activity.messengerId ?? 0)) {
                    HStack(alignment: .center) {
                        CircleImageView(imageUrl: activity.messenger?.avatar?.medium, size: 24)
                        
                        Text(activity.messenger?.name ?? "Loading")
                            .bold()
                            .font(.subheadline)
                            .padding(.bottom, 1)
                    }
                }
                .foregroundStyle(.primary)
                Spacer()
                let createdAt = Date(timeIntervalSince1970: Double(activity.createdAt))
                Text("\(createdAt, format: .relative(presentation: .numeric))")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom, 1)
            }//:HStack
            
            Markdown(activity.message?.formatMarkdown() ?? "Loading")
                .defaultStyle()
            
            HStack {
                Spacer()
                NavigationLink(
                    destination: Text("WIP")
                ) {
                    Label("\(activity.replyCount)", systemImage: "bubble")
                }
                .frame(width: 62, alignment: .leading)
                Button(
                    action: {
                        //viewModel.toggleLikeComment(commentId: comment.id)
                        isLiked.toggle()
                        if isLiked {
                            likeCount += 1
                        } else {
                            likeCount -= 1
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
    MessageActivityItemView()
}*/
