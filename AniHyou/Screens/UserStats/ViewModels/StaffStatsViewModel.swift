//
//  StaffStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

@MainActor
class StaffStatsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var distribution: StatDistributionType = .titles
    @Published var staff = [StaffStat]()
    
    func getStaffStats(userId: Int, mediaType: MediaType) async {
        isLoading = true
        if let result = await UserStatsRepository.getStaffStats(
            userId: userId,
            mediaType: mediaType,
            distribution: distribution
        ) {
            staff = result
        }
        isLoading = false
    }
}
