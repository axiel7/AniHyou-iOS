//
//  VoiceActorsStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

@MainActor
class VoiceActorsStatsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var distribution: StatDistributionType = .titles
    @Published var voiceActors = [VoiceActorStat]()
    
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
