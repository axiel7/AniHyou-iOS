//
//  MediaReviewsAndThreadsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 5/7/22.
//

import SwiftUI

struct MediaReviewsAndThreadsView: View {

    var mediaId: Int
    @StateObject private var viewModel = ReviewThreadViewModel()
    private let gridRows = [
        GridItem(.flexible(), spacing: 0, alignment: .leading),
        GridItem(.flexible(), spacing: 0, alignment: .leading)
    ]

    var body: some View {
        VStack(alignment: .leading) {

            if viewModel.mediaThreads.count > 0 {
                Text("Threads")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 8) {
                        ForEach(viewModel.mediaThreads, id: \.?.id) {
                            if let thread = $0 {
                                NavigationLink(destination: ThreadDetailsView(thread: thread)) {
                                    ThreadItemView(thread: thread)
                                }
                            }
                        }
                    }//:HStack
                    .padding(.leading)
                    .frame(height: 160)
                }//:HScrollView
            }

            Text("Reviews")
                .font(.title3)
                .bold()
                .padding(.leading)
            ZStack {
                if viewModel.mediaReviews == nil {
                    HorizontalProgressView()
                        .padding()
                        .onAppear {
                            viewModel.getMediaReviews(mediaId: mediaId)
                        }
                } else if viewModel.mediaReviews?.nodes?.count == 0 {
                    HStack {
                        Spacer()
                        Text("No reviews")
                            .padding()
                        Spacer()
                    }
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: gridRows, spacing: 8) {
                            ForEach(viewModel.mediaReviews!.nodes ?? [], id: \.?.id) {
                                if let review = $0 {
                                    NavigationLink(destination: ReviewDetailsView(reviewId: review.id)) {
                                        ReviewItemView(review: review)
                                    }
                                }
                            }
                        }//:HGrid
                        .padding(.leading)
                    }//:HScrollView
                    .frame(height: 320)
                }
            }//:ZStack
        }//:VStack
        .onAppear {
            viewModel.getMediaThreads(mediaId: mediaId)
        }
    }
}

struct MediaReviewsAndThreadsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaReviewsAndThreadsView(mediaId: 1)
    }
}
