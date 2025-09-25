//
//  RelationRecommendationViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation
import AniListAPI

@Observable class RelationRecommendationViewModel {

    var mediaRelationsAndRecommendations: MediaRelationsAndRecommendationsQuery.Data.Media?

    func getMediaRelationsAndRecommendations(mediaId: Int) async {
        if let result = await MediaRepository.getMediaRelationsAndRecommendations(mediaId: mediaId) {
            mediaRelationsAndRecommendations = result
        }
    }
}
