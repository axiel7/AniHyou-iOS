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

    var viewModel: ThreadDetailsViewModel
    
    let comment: ChildCommentsQuery.Data.Page.ThreadComment?
    @State var childCommentsParsed: [ChildCommentsQuery.Data.Page.ThreadComment]?
    @State var isLiked: Bool
    @State var likeCount: Int
    @State var commentButtonDisabled = false
    
    init(
        viewModel: ThreadDetailsViewModel,
        comment: ChildCommentsQuery.Data.Page.ThreadComment?,
        commentButtonDisabled: Bool = false
    ) {
        self.viewModel = viewModel
        self.comment = comment
        self.isLiked = comment?.isLiked == true
        self.likeCount = comment?.likeCount ?? 0
        self.commentButtonDisabled = commentButtonDisabled
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NavigationLink(destination: ProfileView(userId: comment?.user?.id ?? 0)) {
                    HStack(alignment: .center) {
                        CircleImageView(imageUrl: comment?.user?.avatar?.medium, size: 24)

                        Text(comment?.user?.name ?? "Loading")
                            .bold()
                            .font(.subheadline)
                            .padding(.bottom, 1)
                    }
                }
                .buttonStyle(.plain)
                Spacer()
                let createdAt = Date(timeIntervalSince1970: Double(comment?.createdAt ?? 0))
                Text("\(createdAt, format: .relative(presentation: .numeric))")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 1)
            }

            Markdown(comment?.comment?.formatMarkdown() ?? "Loading")
                .defaultStyle()

            HStack {
                Spacer()
                NavigationLink(
                    destination: ThreadCommentDetailsView(viewModel: viewModel, comment: comment!)
                ) {
                    Label("\(childCommentsParsed?.count ?? 0)", systemImage: "bubble")
                }
                .disabled(commentButtonDisabled)
                .frame(width: 60, alignment: .leading)
                Button(
                    action: {
                        Task {
                            if let liked = await viewModel.toggleLikeComment(
                                commentId: comment!.id
                            ) {
                                isLiked = liked
                                if liked {
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
            }
            .padding(.top, 4)
        }
        .padding(.leading)
        .padding(.trailing)
        .task {
            childCommentsParsed = await comment?.childComments?.toThreadComments()
            commentButtonDisabled = commentButtonDisabled && childCommentsParsed?.isEmpty == false
        }
    }
}

#Preview {
    NavigationStack {
        ThreadCommentItemView(
            viewModel: ThreadDetailsViewModel(),
            comment: nil
        )
    }
}
