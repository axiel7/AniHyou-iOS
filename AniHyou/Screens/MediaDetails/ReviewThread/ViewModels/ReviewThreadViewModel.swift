//
//  ReviewThreadViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation
import AniListAPI

@Observable class ReviewThreadViewModel {

    var dataFetched = false
    var reviews = [MediaReviewsQuery.Data.Media.Reviews.Node]()

    func getMediaReviews(mediaId: Int) async {
        if let result = await MediaRepository.getMediaReviews(mediaId: mediaId, page: 1) {
            reviews = result.data
        }
        dataFetched = true
    }

    var threads = [BasicThreadDetails]()

    func getMediaThreads(mediaId: Int) async {
        if let result = await MediaRepository.getMediaThreads(mediaId: mediaId, page: 1) {
            threads = result.data
        }
    }
}
