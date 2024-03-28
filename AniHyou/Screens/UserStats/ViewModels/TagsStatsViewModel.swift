//
//  TagsStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import Foundation
import AniListAPI

class TagsStatsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var distribution: StatDistributionType = .titles
    @Published var tags = [TagStat]()
    
    func getTagsStats(userId: Int, mediaType: MediaType) {
        isLoading = true
        let sort = distribution.userStatisticsSort(ascencing: false)
        if mediaType == .anime {
            Network.shared.apollo.fetch(
                query: UserStatsAnimeTagsQuery(
                    userId: .some(userId),
                    sort: .some([.case(sort)])
                )
            ) { [weak self] result in
                switch result {
                case .success(let graphQLResult):
                    if let tags = graphQLResult.data?.user?.statistics?.anime?.tags {
                        self?.tags = tags.compactMap { $0?.fragments.tagStat }
                    }
                case .failure(let error):
                    print(error)
                }
                self?.isLoading = false
            }
        } else if mediaType == .manga {
            Network.shared.apollo.fetch(
                query: UserStatsMangaTagsQuery(
                    userId: .some(userId),
                    sort: .some([.case(sort)])
                )
            ) { [weak self] result in
                switch result {
                case .success(let graphQLResult):
                    if let tags = graphQLResult.data?.user?.statistics?.manga?.tags {
                        self?.tags = tags.compactMap { $0?.fragments.tagStat }
                    }
                case .failure(let error):
                    print(error)
                }
                self?.isLoading = false
            }
        }
    }
}
