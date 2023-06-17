//
//  ThreadCommentItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/08/2022.
//

import SwiftUI
import AniListAPI

struct ThreadCommentItemView: View {
    
    var comment: ThreadCommentsQuery.Data.Page.ThreadComment
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                HStack(alignment: .center) {
                    CircleImageView(imageUrl: comment.user?.avatar?.medium, size: 24)
                    Text(comment.user?.name ?? "Loading")
                        .bold()
                        .font(.subheadline)
                        .padding(.bottom, 1)
                }
                Spacer()
                Text(comment.createdAt.timestampToDateString())
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom, 1)
            }
            
            Text(.init(comment.comment ?? "Loading"))
                .font(.subheadline)
                .padding(.bottom, 4)
            
            HStack {
                Spacer()
                Label("\(comment.likeCount)", systemImage: "heart")
            }
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct ThreadCommentItemView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCommentItemView(comment: .init(_fieldData: nil))
    }
}
