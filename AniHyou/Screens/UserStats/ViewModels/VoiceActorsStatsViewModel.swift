//
//  VoiceActorsStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

class VoiceActorsStatsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var distribution: StatDistributionType = .titles
    @Published var voiceActors = [VoiceActorStat]()
    
    func getVoiceActorsStats(userId: Int) {
        isLoading = true
        let sort = distribution.userStatisticsSort(ascencing: false)
        Network.shared.apollo.fetch(
            query: UserStatsVoiceActorsQuery(
                userId: .some(userId),
                sort: .some([.case(sort)])
            )
        ) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let voiceActors = graphQLResult.data?.user?.statistics?.anime?.voiceActors {
                    self?.voiceActors = voiceActors.compactMap { $0?.fragments.voiceActorStat }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
}
