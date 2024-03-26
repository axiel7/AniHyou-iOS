//
//  ThreadDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 6/8/22.
//

import SwiftUI
import MarkdownUI
import AniListAPI

struct ThreadDetailsView: View {

    @StateObject private var viewModel = ThreadDetailsViewModel()
    
    let threadId: Int
    var initThread: BasicThreadDetails?
    
    init(thread: BasicThreadDetails) {
        self.initThread = thread
        self.threadId = thread.id
    }
    
    init(threadId: Int) {
        self.threadId = threadId
    }

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                if let thread = viewModel.details ?? initThread {
                    // MARK: thread info
                    VStack(alignment: .leading) {
                        Text(thread.title ?? "")
                            .bold()
                            .font(.title3)
                            .padding(.leading)
                            .padding(.bottom, 1)
                        
                        let createdAt = Date(timeIntervalSince1970: Double(thread.createdAt))
                        Text(createdAt, style: .relative)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                        
                        Markdown(thread.body?.formatMarkdown() ?? "")
                            .defaultStyle()
                            .padding()
                        
                        HStack {
                            NavigationLink(destination: ProfileView(userId: thread.user!.id)) {
                                HStack(alignment: .center) {
                                    CircleImageView(
                                        imageUrl: thread.user?.avatar?.medium,
                                        size: 24
                                    )
                                    Text(thread.user?.name ?? "")
                                        .lineLimit(1)
                                        .foregroundStyle(.primary)
                                }
                            }
                            .buttonStyle(.plain)
                            Spacer()
                            Button(
                                action: { viewModel.toggleLikeThread(threadId: threadId) }
                            ) {
                                Label("\(thread.likeCount)", systemImage: "heart")
                            }
                        }
                        .padding(.horizontal)
                    }//:VStack
                    .padding(.bottom)
                } else {
                    HorizontalProgressView()
                        .padding()
                        .onAppear {
                            viewModel.getThreadDetails(threadId: threadId)
                        }
                }

                // MARK: thread comments
                ForEach(viewModel.threadComments, id: \.?.id) {
                    if let comment = $0 {
                        VStack {
                            Divider()
                                .padding(.vertical, 4)
                            ThreadCommentItemView(viewModel: viewModel, comment: comment)
                        }
                    }
                }
                .padding(.bottom)

                if viewModel.hasNextPage || initThread != nil {
                    ProgressView()
                        .onAppear {
                            viewModel.getThreadComments(threadId: threadId)
                        }
                }
            }//:LazyVStack
        }//:VScrollView
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ThreadDetailsView(threadId: 1)
}
