//
//  MediaReviewsAndThreadsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 5/7/22.
//

import SwiftUI

struct MediaReviewsAndThreadsView: View {
    
    @ObservedObject var viewModel: MediaDetailsViewModel
    private let gridRows = [
        GridItem(.flexible(), spacing: 0, alignment: .leading),
        GridItem(.flexible(), spacing: 0, alignment: .leading)
    ]
    
    var body: some View {
        if viewModel.mediaReviews != nil {
            VStack(alignment: .leading) {
                
                Text("Reviews")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
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
            }//:VStack
        } else {
            HStack {
                Spacer()
                ProgressView()
                    .padding()
                Spacer()
            }
        }
    }
}

struct MediaReviewsAndThreadsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaReviewsAndThreadsView(viewModel: MediaDetailsViewModel())
    }
}
