//
//  ThreadDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 6/8/22.
//

import SwiftUI
import RichText
import AniListAPI

struct ThreadDetailsView: View {
    
    var thread: MediaThreadsQuery.Data.Page.Thread
    @StateObject private var viewModel = ThreadDetailsViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                //MARK: thread info
                VStack(alignment: .leading) {
                    Text(thread.title ?? "")
                        .bold()
                        .font(.title3)
                        .padding(.leading)
                        .padding(.bottom, 1)
                    
                    Text(thread.createdAt.timestampToDateString())
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.leading)
                    
                    RichText(html: thread.body ?? "")
                        .defaultStyle()
                        .customCSS(spoilerCss)
                        .padding(.horizontal)
                    
                    HStack {
                        NavigationLink(destination: ProfileView(userId: thread.user!.id)) {
                            HStack(alignment: .center) {
                                CircleImageView(imageUrl: thread.user?.avatar?.medium, size: 24)
                                Text(thread.user?.name ?? "")
                                    .lineLimit(1)
                                    .foregroundColor(.primary)
                            }
                        }
                        .buttonStyle(.plain)
                        Spacer()
                        Label("\(thread.likeCount)", systemImage: "heart")
                    }
                    .padding(.horizontal)
                }//:VStack
                .padding(.bottom)
                
                //MARK: thread comments
                ForEach(viewModel.threadComments, id: \.?.id) {
                    if let comment = $0 {
                        VStack {
                            Divider()
                                .padding(.vertical, 4)
                            ThreadCommentItemView(comment: comment)
                        }
                    }
                }
                .padding(.bottom)
                
                if viewModel.hasNextPage {
                    ProgressView()
                        .onAppear {
                            viewModel.getThreadComments(threadId: thread.id)
                        }
                }
            }//:LazyVStack
        }//:VScrollView
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ThreadDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadDetailsView(thread: .init(_fieldData: nil))
    }
}
