//
//  ThreadCommentItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/08/2022.
//

import SwiftUI
import AniListAPI
import MarkdownUI

struct ThreadCommentItemView: View {

    let comment: ThreadCommentsQuery.Data.Page.ThreadComment

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NavigationLink(destination: ProfileView(userId: comment.user!.id)) {
                    HStack(alignment: .center) {
                        CircleImageView(imageUrl: comment.user?.avatar?.medium, size: 24)

                        Text(comment.user?.name ?? "Loading")
                            .bold()
                            .font(.subheadline)
                            .padding(.bottom, 1)
                    }
                }
                .buttonStyle(.plain)
                Spacer()
                Text(comment.createdAt.timestampToDateString())
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom, 1)
            }

            Markdown(comment.comment?.formatMarkdown() ?? "Loading")
                .defaultStyle()

            HStack {
                Spacer()
                Label("\(comment.likeCount)", systemImage: "heart")
            }
            .padding(.top, 4)
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

#Preview {
    ThreadCommentItemView(comment: .init(_fieldData: nil))
}
