//
//  ReviewRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

struct ReviewRepository {
    
    static func getReviewDetails(reviewId: Int) async -> CommonReviewDetails? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(query: ReviewDetailsQuery(reviewId: .some(reviewId))) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.review?.fragments.commonReviewDetails)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func rateReview(
        reviewId: Int,
        rating: ReviewRating
    ) async -> CommonReviewDetails? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.perform(
                mutation: RateReviewMutation(
                    reviewId: .some(reviewId),
                    rating: .some(.case(rating))
                )
            ) { result in
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
                                continuation.resume(returning: newObject)
                            } catch {
                                print(error)
                                continuation.resume(returning: nil)
                            }
                        }
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
