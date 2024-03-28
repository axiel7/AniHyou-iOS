//
//  GenresStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 27/03/2024.
//

import Foundation
import AniListAPI

class GenresStatsViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var distribution: StatDistributionType = .titles
    @Published var genres = [GenreStat]()
    
    func getGenresStats(userId: Int, mediaType: MediaType) {
        isLoading = true
        let sort = distribution.userStatisticsSort(ascencing: false)
        if mediaType == .anime {
            Network.shared.apollo.fetch(
                query: UserStatsAnimeGenresQuery(
                    userId: .some(userId),
                    sort: .some([.case(sort)])
                )
            ) { [weak self] result in
                switch result {
                case .success(let graphQLResult):
                    if let genres = graphQLResult.data?.user?.statistics?.anime?.genres {
                        self?.genres = genres.compactMap { $0?.fragments.genreStat }
                    }
                case .failure(let error):
                    print(error)
                }
                self?.isLoading = false
            }
        } else if mediaType == .manga {
            Network.shared.apollo.fetch(
                query: UserStatsMangaGenresQuery(
                    userId: .some(userId),
                    sort: .some([.case(sort)])
                )
            ) { [weak self] result in
                switch result {
                case .success(let graphQLResult):
                    if let genres = graphQLResult.data?.user?.statistics?.manga?.genres {
                        self?.genres = genres.compactMap { $0?.fragments.genreStat }
                    }
                case .failure(let error):
                    print(error)
                }
                self?.isLoading = false
            }
        }
    }
}
