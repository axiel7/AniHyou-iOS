//
//  StaffStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

@MainActor
@Observable class StaffStatsViewModel {
    
    var isLoading = false
    var distribution: StatDistributionType = .titles
    var staff = [StaffStat]()
    
    func getStaffStats(userId: Int, mediaType: MediaType) async {
        isLoading = true
        if let result = await UserStatsRepository.getStaffStats(
            userId: Int32(userId),
            mediaType: mediaType,
            distribution: distribution
        ) {
            staff = result
        }
        isLoading = false
    }
}
