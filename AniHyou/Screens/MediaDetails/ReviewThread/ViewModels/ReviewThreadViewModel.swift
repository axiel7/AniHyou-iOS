//
//  ReviewThreadViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation
import API

class ReviewThreadViewModel: ObservableObject {
    
    @Published var mediaReviews: MediaReviewsQuery.Data.Media.Reviews?
    
    func getMediaReviews(mediaId: Int) {
        Network.shared.apollo.fetch(query: MediaReviewsQuery(mediaId: .some(mediaId), page: .some(1), perPage: .some(10))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let reviews = graphQLResult.data?.media?.reviews {
                    self?.mediaReviews = reviews
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @Published var mediaThreads = [MediaThreadsQuery.Data.Page.Thread?]()
    
    func getMediaThreads(mediaId: Int) {
        Network.shared.apollo.fetch(query: MediaThreadsQuery(page: .some(1), perPage: .some(10), mediaCategoryId: .some(mediaId), sort: .some([.case(.isSticky), .case(.createdAtDesc)]))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let threads = graphQLResult.data?.page?.threads {
                    self?.mediaThreads = threads
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
