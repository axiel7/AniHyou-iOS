//
//  MediaStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/01/2023.
//

import Foundation

class MediaStatsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var statusDistribution = [Stat]()
    @Published var rankings = [MediaStatsQuery.Data.Media.Ranking?]()
    
    func getMediaStats(mediaId: Int) {
        isLoading = true
        Network.shared.apollo.fetch(query: MediaStatsQuery(mediaId: .some(mediaId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.media {
                    media.stats?.statusDistribution?.forEach {
                        if let stat = $0 {
                            self?.statusDistribution.append(Stat(id: stat.status!.value!.localizedName, value: CGFloat(stat.amount ?? 0), color: stat.status!.value!.color))
                        }
                    }
                    self?.rankings = media.rankings ?? []
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
}
