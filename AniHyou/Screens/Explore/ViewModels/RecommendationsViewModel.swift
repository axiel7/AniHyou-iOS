//
//  RecommendationsViewModel.swift
//  AniHyou
//
//  Created by Axel on 26/08/2026.
//

import Foundation
import AniListAPI

@MainActor
@Observable class RecommendationsViewModel {
    
    static let sortOptions: [RecommendationSort] = [.idDesc, .ratingDesc]
    
    var isLoading = false
    var recommendations: [CommonRecommendation] = []
    var onList: Bool?
    var sort = RecommendationSort.idDesc
    var page: Int32 = 1
    var hasNextPage = false
    
    func getRecommendations(forceReload: Bool = false) async {
        isLoading = true
        defer { isLoading = false }
        if let result = await MediaRepository.getMediaRecommendations(
            onList: onList,
            sort: [sort],
            displayAdult: UserDefaults.standard.bool(forKey: DISPLAY_ADULT),
            page: page
        ) {
            recommendations += result.data
            page = result.page
            hasNextPage = result.hasNextPage
        }
    }
    
    func saveRating(
        _ item: CommonRecommendation,
        rating: RecommendationRating
    ) async {
        if let mediaId = item.media?.id, let mediaRecId = item.mediaRecommendation?.id {
            var newRating = rating
            if item.userRating?.value == rating { newRating = .noRating }
            
            if let result = await MediaRepository.saveRecommendation(
                mediaId: mediaId.toInt32(),
                mediaRecommendationId: mediaRecId.toInt32(),
                rating: newRating
            ) {
                if let index = recommendations.firstIndex(of: item) {
                    recommendations[index] = result
                }
            }
        }
    }
    
    func toggleOnList() {
        // note: onList = false is bugged with recommendations api
        if onList == true { onList = nil } else { onList = true }
    }
    
    func onRefresh() async {
        hasNextPage = false
        page = 1
        recommendations.removeAll()
        await getRecommendations(forceReload: true)
    }
}
