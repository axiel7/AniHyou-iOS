//
//  ReviewDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 5/7/22.
//

import SwiftUI
import RichText

struct ReviewDetailsView: View {

    let reviewId: Int
    @StateObject private var viewModel = ReviewDetailsViewModel()

    var body: some View {
        ScrollView(.vertical) {
            if let review = viewModel.review {
                Text(review.summary!)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                RichText(html: review.body!)
                    .defaultStyle()
                    .padding()
                HStack {
                    Spacer()
                    MediaStatView(name: "Score", value: "\(review.score ?? 0)/100", showDivider: false)
                    Spacer()
                }
                .padding()
                HStack {
                    MediaStatView(
                        name: "Users likes",
                        value: "\(viewModel.userAcceptance)%",
                        showDivider: false
                    )

                    let userRating = viewModel.review?.userRating?.value
                    let isUpvote = userRating == .upVote
                    Button(
                        review.rating?.stringValue ?? "",
                        systemImage: isUpvote ? "hand.thumbsup.fill" : "hand.thumbsup"
                    ) {
                        Task {
                            await viewModel.rateReview(
                                reviewId: reviewId,
                                rating: isUpvote ? .noVote : .upVote
                            )
                        }
                    }
                    .padding(.horizontal)

                    let isDownVote = userRating == .downVote
                    Button(
                        review.ratingAmount?.minus(review.rating)?.stringValue ?? "",
                        systemImage: isDownVote ? "hand.thumbsdown.fill" : "hand.thumbsdown"
                    ) {
                        Task {
                            await viewModel.rateReview(
                                reviewId: reviewId,
                                rating: isDownVote ? .noVote : .downVote
                            )
                        }
                    }
                }
                .padding(.top, 4)
                .padding([.horizontal, .bottom])
            } else {
                HorizontalProgressView()
            }
        }
        .navigationTitle(viewModel.review?.user?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getReviewDetails(reviewId: reviewId)
        }
    }
}

#Preview {
    ReviewDetailsView(reviewId: 10734)
}
