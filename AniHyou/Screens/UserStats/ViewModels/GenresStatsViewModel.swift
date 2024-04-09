//
//  GenresStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 27/03/2024.
//

import Foundation
import AniListAPI

@MainActor
class GenresStatsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var distribution: StatDistributionType = .titles
    @Published var genres = [GenreStat]()
    
    func getGenresStats(userId: Int, mediaType: MediaType) async {
        isLoading = true
        if let result = await UserStatsRepository.getGenresStats(
            userId: userId,
            mediaType: mediaType,
            distribution: distribution
        ) {
            genres = result
        }
        isLoading = false
    }
}
