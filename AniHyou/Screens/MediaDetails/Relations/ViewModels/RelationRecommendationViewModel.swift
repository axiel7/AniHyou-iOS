//
//  RelationRecommendationViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation

class RelationRecommendationViewModel: ObservableObject {
    
    @Published var mediaRelationsAndRecommendations: MediaRelationsAndRecommendationsQuery.Data.Medium?
    
    func getMediaRelationsAndRecommendations(mediaId: Int) {
        Network.shared.apollo.fetch(query: MediaRelationsAndRecommendationsQuery(mediaId: mediaId)) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.media {
                    self?.mediaRelationsAndRecommendations = media
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
