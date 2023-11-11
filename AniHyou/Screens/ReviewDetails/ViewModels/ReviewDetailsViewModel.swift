//
//  ReviewDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 7/7/22.
//

import Foundation
import AniListAPI

class ReviewDetailsViewModel: ObservableObject {

    @Published var review: ReviewDetailsQuery.Data.Review?
    var userAcceptance: Int {
        guard let rating = review?.rating else { return 0 }
        guard let ratingAmount = review?.ratingAmount else { return 0 }
        return rating * 100 / ratingAmount
    }

    func getReviewDetails(reviewId: Int) {
        Network.shared.apollo.fetch(query: ReviewDetailsQuery(reviewId: .some(reviewId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let review = graphQLResult.data?.review {
                    self?.review = review
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
