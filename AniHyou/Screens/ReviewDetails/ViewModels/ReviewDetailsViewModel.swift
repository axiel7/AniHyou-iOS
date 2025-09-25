//
//  ReviewDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 7/7/22.
//

import Foundation
import AniListAPI

@Observable class ReviewDetailsViewModel {

    var review: CommonReviewDetails?
    var userAcceptance: Int {
        guard let rating = review?.rating else { return 0 }
        guard let ratingAmount = review?.ratingAmount else { return 0 }
        return rating * 100 / ratingAmount
    }

    func getReviewDetails(reviewId: Int) async {
        review = await ReviewRepository.getReviewDetails(reviewId: reviewId)
    }
    
    func rateReview(reviewId: Int, rating: ReviewRating) async {
        if let result = await ReviewRepository.rateReview(reviewId: reviewId, rating: rating) {
            review = result
        }
    }
}
