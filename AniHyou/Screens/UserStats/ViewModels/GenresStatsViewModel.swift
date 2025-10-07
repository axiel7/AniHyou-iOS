//
//  GenresStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 27/03/2024.
//

import Foundation
import AniListAPI

@MainActor
@Observable class GenresStatsViewModel {
    
    var isLoading = false
    var distribution: StatDistributionType = .titles
    var genres = [GenreStat]()
    
    func getGenresStats(userId: Int, mediaType: MediaType) async {
        isLoading = true
        if let result = await UserStatsRepository.getGenresStats(
            userId: Int32(userId),
            mediaType: mediaType,
            distribution: distribution
        ) {
            genres = result
        }
        isLoading = false
    }
}
