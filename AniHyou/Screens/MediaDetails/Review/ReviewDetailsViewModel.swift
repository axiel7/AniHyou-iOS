//
//  ReviewDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 7/7/22.
//

import Foundation

class ReviewDetailsViewModel: ObservableObject {
    
    @Published var reviewDetails: ReviewDetailsQuery.Data.Review?
    @Published var reviewBody: String?
    
    func getReviewDetails(reviewId: Int) {
        Network.shared.apollo.fetch(query: ReviewDetailsQuery(reviewId: reviewId)) { [weak self] result in
            switch (result) {
            case .success(let graphQLResult):
                if let review = graphQLResult.data?.review {
                    self?.reviewDetails = review
                    self?.reviewBody = review.body ?? ""
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
