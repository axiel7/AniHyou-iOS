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
            if viewModel.reviewBody != nil {
                RichText(html: viewModel.reviewBody!)
                    .defaultStyle()
                    .customCSS(spoilerCss)
                    .padding()
            } else {
                ProgressView()
            }
        }
        .navigationTitle(viewModel.reviewDetails?.user?.name ?? "")
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
