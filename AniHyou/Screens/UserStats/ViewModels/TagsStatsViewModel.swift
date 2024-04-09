//
//  TagsStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

@MainActor
class TagsStatsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var distribution: StatDistributionType = .titles
    @Published var tags = [TagStat]()
    
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
