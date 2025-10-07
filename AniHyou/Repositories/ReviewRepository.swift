//
//  ReviewRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

struct ReviewRepository {
    
    static func getReviewDetails(reviewId: Int32) async -> CommonReviewDetails? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: ReviewDetailsQuery(reviewId: .some(reviewId))
            )
            return result.data?.review?.fragments.commonReviewDetails
        } catch {
            print(error)
            return nil
        }
    }
    
    static func rateReview(
        reviewId: Int32,
        rating: ReviewRating
    ) async -> CommonReviewDetails? {
        do {
            let result = try await Network.shared.apollo.perform(
                mutation: RateReviewMutation(
                    reviewId: .some(reviewId),
                    rating: .some(.case(rating))
                )
            )
            if let data = result.data?.rateReview {
                return try await Network.shared.apollo.store.withinReadWriteTransaction { transaction in
                    do {
                        try await transaction.updateObject(
                            ofType: CommonReviewDetails.self,
                            withKey: "Review:\(reviewId)"
                        ) { (cachedData: inout CommonReviewDetails) in
                            cachedData.userRating = data.userRating
                            cachedData.rating = data.rating
                            cachedData.ratingAmount = data.ratingAmount
                        }
                        let newObject = try await transaction.readObject(
                            ofType: CommonReviewDetails.self,
                            withKey: "Review:\(reviewId)"
                        )
                        return newObject
                    } catch {
                        print(error)
                        return nil
                    }
                }
            }
            return nil
        } catch {
            print(error)
            return nil
        }
    }
}
