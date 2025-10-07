//
//  StudiosStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

@MainActor
@Observable class StudiosStatsViewModel {
    
    var isLoading = false
    var distribution: StatDistributionType = .titles
    var studios = [StudioStat]()
    
    func getStudiosStats(userId: Int) async {
        isLoading = true
        if let result = await UserStatsRepository.getStudiosStats(
            userId: Int32(userId),
            distribution: distribution
        ) {
            studios = result
        }
        isLoading = false
    }
}
