//
//  VoiceActorsStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

@Observable class VoiceActorsStatsViewModel {
    
    var isLoading = false
    var distribution: StatDistributionType = .titles
    var voiceActors = [VoiceActorStat]()
    
    func getVoiceActorsStats(userId: Int) async {
        isLoading = true
        if let result = await UserStatsRepository.getVoiceActorsStats(
            userId: userId,
            distribution: distribution
        ) {
            voiceActors = result
        }
        isLoading = false
    }
}
