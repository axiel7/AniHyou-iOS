//
//  StaffStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

class StaffStatsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var distribution: StatDistributionType = .titles
    @Published var staff = [StaffStat]()
    
    func getStaffStats(userId: Int, mediaType: MediaType) {
        isLoading = true
        let sort = distribution.userStatisticsSort(ascencing: false)
        if mediaType == .anime {
            Network.shared.apollo.fetch(
                query: UserStatsAnimeStaffQuery(
                    userId: .some(userId),
                    sort: .some([.case(sort)])
                )
            ) { [weak self] result in
                switch result {
                case .success(let graphQLResult):
                    if let genres = graphQLResult.data?.user?.statistics?.anime?.staff {
                        self?.staff = genres.compactMap { $0?.fragments.staffStat }
                    }
                case .failure(let error):
                    print(error)
                }
                self?.isLoading = false
            }
        } else if mediaType == .manga {
            Network.shared.apollo.fetch(
                query: UserStatsMangaStaffQuery(
                    userId: .some(userId),
                    sort: .some([.case(sort)])
                )
            ) { [weak self] result in
                switch result {
                case .success(let graphQLResult):
                    if let genres = graphQLResult.data?.user?.statistics?.manga?.staff {
                        self?.staff = genres.compactMap { $0?.fragments.staffStat }
                    }
                case .failure(let error):
                    print(error)
                }
                self?.isLoading = false
            }
        }
    }
}
