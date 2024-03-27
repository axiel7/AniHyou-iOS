//
//  ReviewDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 7/7/22.
//

import Foundation
import AniListAPI

class ReviewDetailsViewModel: ObservableObject {

    @Published var review: CommonReviewDetails?
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
                    self?.review = review.fragments.commonReviewDetails
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func rateReview(reviewId: Int, rating: ReviewRating) {
        Network.shared.apollo.perform(
            mutation: RateReviewMutation(
                reviewId: .some(reviewId),
                rating: .some(.case(rating))
            )
        ) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.rateReview {
                    Network.shared.apollo.store.withinReadWriteTransaction { transaction in
                        do {
                            try transaction.updateObject(
                                ofType: CommonReviewDetails.self,
                                withKey: "Review:\(reviewId)"
                            ) { (cachedData: inout CommonReviewDetails) in
                                cachedData.userRating = data.userRating
                                cachedData.rating = data.rating
                                cachedData.ratingAmount = data.ratingAmount
                            }
                            let newObject = try transaction.readObject(
                                ofType: CommonReviewDetails.self,
                                withKey: "Review:\(reviewId)"
                            )
                            DispatchQueue.main.async {
                                self?.review = newObject
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
