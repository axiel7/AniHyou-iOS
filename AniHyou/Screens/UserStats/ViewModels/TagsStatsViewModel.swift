//
//  TagsStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

@Observable class TagsStatsViewModel {
    
    var isLoading = false
    var distribution: StatDistributionType = .titles
    var tags = [TagStat]()
    
    func getTagsStats(userId: Int, mediaType: MediaType) async {
        isLoading = true
        if let result = await UserStatsRepository.getTagsStats(
            userId: userId,
            mediaType: mediaType,
            distribution: distribution
        ) {
            tags = result
        }
        isLoading = false
    }
}
