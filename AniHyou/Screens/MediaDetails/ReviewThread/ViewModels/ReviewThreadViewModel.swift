//
//  ReviewThreadViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation

class ReviewThreadViewModel: ObservableObject {
    
    @Published var mediaReviews: MediaReviewsQuery.Data.Medium.Review?
    
    func getMediaReviews(mediaId: Int) {
        Network.shared.apollo.fetch(query: MediaReviewsQuery(mediaId: mediaId, page: 1, perPage: 10)) { [weak self] result in
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
        Network.shared.apollo.fetch(query: MediaThreadsQuery(page: 1, perPage: 10, mediaCategoryId: mediaId, sort: [.isSticky, .createdAtDesc])) { [weak self] result in
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
