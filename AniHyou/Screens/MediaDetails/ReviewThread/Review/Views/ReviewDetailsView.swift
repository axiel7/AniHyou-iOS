//
//  ReviewDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 5/7/22.
//

import SwiftUI
import RichText

struct ReviewDetailsView: View {

    var reviewId: Int
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
                    .customCSS(spoilerCss)
                    .padding()
                HStack {
                    Spacer()
                    MediaStatView(name: "Score", value: "\(review.score ?? 0)/100", showDivider: false)
                    Spacer()
                    MediaStatView(
                        name: "Users likes",
                        value: String(swiftLintMultiline:
                            "\(viewModel.userAcceptance)% ",
                            "(\(review.rating ?? 0)/\(review.ratingAmount ?? 0))"
                        ),
                        showDivider: false
                    )
                    Spacer()
                }
                .padding()
            } else {
                ProgressView()
            }
        }
        .navigationTitle(viewModel.review?.user?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getReviewDetails(reviewId: reviewId)
        }
    }
}

struct ReviewDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDetailsView(reviewId: 10734)
    }
}
