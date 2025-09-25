//
//  StudiosStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

@Observable class StudiosStatsViewModel {
    
    var isLoading = false
    var distribution: StatDistributionType = .titles
    var studios = [StudioStat]()
    
    func getStudiosStats(userId: Int) async {
        isLoading = true
        if let result = await UserStatsRepository.getStudiosStats(
            userId: userId,
            distribution: distribution
        ) {
            studios = result
        }
        isLoading = false
    }
}
