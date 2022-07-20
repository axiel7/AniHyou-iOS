//
//  ReviewDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 5/7/22.
//

import SwiftUI

struct ReviewDetailsView: View {
    
    var reviewId: Int
    @StateObject private var viewModel = ReviewDetailsViewModel()
    
    var body: some View {
        VStack {
            if !viewModel.reviewBody.isEmpty {
                WebView(htmlString: $viewModel.reviewBody, baseURL: .constant(nil))
            }
        }
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
