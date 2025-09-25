//
//  MediaStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/01/2023.
//

import Foundation
import SwiftUI
import AniListAPI

@Observable class MediaStatsViewModel {

    var isLoading = true
    var statusDistribution = [Stat]()
    var scoreDistribution = [Stat]()
    var rankings = [MediaStatsQuery.Data.Media.Ranking]()
    var following = [MediaFollowingQuery.Data.Page.MediaList]()
    
    func fetchData(mediaId: Int) async {
        isLoading = true
        await getMediaStats(mediaId: mediaId)
        await getMediaFollowing(mediaId: mediaId)
        isLoading = false
    }

    private func getMediaStats(mediaId: Int) async {
        if let result = await MediaRepository.getMediaStats(mediaId: mediaId) {
            result.stats?.statusDistribution?.forEach {
                if let stat = $0 {
                    statusDistribution.append(
                        Stat(
                            id: stat.status!.rawValue,
                            idLocalized: stat.status!.value!.localizedName,
                            value: CGFloat(stat.amount ?? 0),
                            color: stat.status!.value!.color
                        )
                    )
                }
            }
            result.stats?.scoreDistribution?.forEach {
                if let stat = $0 {
                    scoreDistribution.append(
                        Stat(
                            id: String(stat.score ?? 0),
                            value: CGFloat(stat.amount ?? 0),
                            color: Color("Score\(String(stat.score ?? 10))")
                        )
                    )
                }
            }
            rankings = result.rankings?.compactMap({ $0 }) ?? []
        }
    }
    
    private func getMediaFollowing(mediaId: Int) async {
        if let result = await MediaRepository.getMediaFollowing(mediaId: mediaId, page: 1, perPage: 25) {
            following = result.data
        }
    }
}
