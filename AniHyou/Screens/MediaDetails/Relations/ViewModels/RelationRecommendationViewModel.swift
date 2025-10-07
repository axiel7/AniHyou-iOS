//
//  RelationRecommendationViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation
import AniListAPI

@MainActor
@Observable class RelationRecommendationViewModel {

    var mediaRelationsAndRecommendations: MediaRelationsAndRecommendationsQuery.Data.Media?

    func getMediaRelationsAndRecommendations(mediaId: Int) async {
        if let result = await MediaRepository.getMediaRelationsAndRecommendations(mediaId: Int32(mediaId)) {
            mediaRelationsAndRecommendations = result
        }
    }
}
