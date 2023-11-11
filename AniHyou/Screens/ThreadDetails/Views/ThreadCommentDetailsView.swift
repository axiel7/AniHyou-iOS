//
//  ThreadCommentDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 16/10/2023.
//

import SwiftUI
import AniListAPI

struct ThreadCommentDetailsView: View {
    
    @ObservedObject var viewModel: ThreadDetailsViewModel
    
    let comment: ChildCommentsQuery.Data.Page.ThreadComment
    @State var isLiked: Bool
    @State var likeCount: Int
    
    init(
        viewModel: ThreadDetailsViewModel,
        comment: ChildCommentsQuery.Data.Page.ThreadComment
    ) {
        self.viewModel = viewModel
        self.comment = comment
        self.isLiked = comment.isLiked == true
        self.likeCount = comment.likeCount
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ThreadCommentItemView(
                    viewModel: viewModel,
                    comment: comment,
                    commentButtonDisabled: true
                )
                Divider()
                    .padding(.vertical)
                if let childComments = comment.childComments {
                    ForEach(childComments, id: \.id) {
                        ThreadCommentItemView(viewModel: viewModel, comment: $0)
                        Divider()
                            .padding(.vertical)
                    }
                }
            }
        }
        .navigationTitle(comment.user?.name ?? "")
    }
}

#Preview {
    ThreadCommentDetailsView(
        viewModel: ThreadDetailsViewModel(),
        comment: .init(_fieldData: nil)
    )
}
