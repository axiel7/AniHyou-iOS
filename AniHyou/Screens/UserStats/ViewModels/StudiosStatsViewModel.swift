//
//  StudiosStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

class StudiosStatsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var distribution: StatDistributionType = .titles
    @Published var studios = [StudioStat]()
    
    func getStudiosStats(userId: Int) {
        isLoading = true
        let sort = distribution.userStatisticsSort(ascencing: false)
        Network.shared.apollo.fetch(
            query: UserStatsStudiosQuery(
                userId: .some(userId),
                sort: .some([.case(sort)])
            )
        ) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let studios = graphQLResult.data?.user?.statistics?.anime?.studios {
                    self?.studios = studios.compactMap { $0?.fragments.studioStat }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
}
