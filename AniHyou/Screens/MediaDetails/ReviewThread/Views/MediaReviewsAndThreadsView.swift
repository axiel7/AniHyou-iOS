//
//  MediaReviewsAndThreadsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 5/7/22.
//

import SwiftUI

struct MediaReviewsAndThreadsView: View {

    let mediaId: Int
    @State private var viewModel = ReviewThreadViewModel()
    private let gridRows = [
        GridItem(.flexible(), spacing: 0, alignment: .leading),
        GridItem(.flexible(), spacing: 0, alignment: .leading)
    ]

    var body: some View {
        VStack(alignment: .leading) {

            if viewModel.threads.count > 0 {
                Text("Threads")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8) {
                        ForEach(viewModel.threads, id: \.id) { thread in
                            NavigationLink(destination: ThreadDetailsView(thread: thread)) {
                                ThreadItemView(thread: thread)
                            }
                            .buttonStyle(.plain)
                        }
                    }//:HStack
                    .scrollTargetLayout()
                    .padding(.leading)
                    .frame(height: 160)
                }//:HScrollView
                .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            }

            Text("Reviews")
                .font(.title3)
                .bold()
                .padding(.leading)
            ZStack {
                if !viewModel.dataFetched {
                    HorizontalProgressView()
                        .padding()
                } else if viewModel.reviews.count == 0 {
                    HStack {
                        Spacer()
                        Text("No reviews")
                            .padding()
                        Spacer()
                    }
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: gridRows, spacing: 8) {
                            ForEach(viewModel.reviews, id: \.id) { review in
                                NavigationLink(destination: ReviewDetailsView(reviewId: review.id)) {
                                    ReviewItemView(review: review)
                                }
                                .buttonStyle(.plain)
                            }
                        }//:HGrid
                        .scrollTargetLayout()
                        .padding(.leading)
                    }//:HScrollView
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                    .frame(height: 320)
                }
            }//:ZStack
        }//:VStack
        .task {
            if !viewModel.dataFetched {
                await viewModel.getMediaThreads(mediaId: mediaId)
                await viewModel.getMediaReviews(mediaId: mediaId)
            }
        }
    }
}

#Preview {
    MediaReviewsAndThreadsView(mediaId: 1)
}
