//
//  MediaStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/01/2023.
//

import Foundation
import SwiftUI
import AniListAPI

@MainActor
class MediaStatsViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var statusDistribution = [Stat]()
    @Published var scoreDistribution = [Stat]()
    @Published var rankings = [MediaStatsQuery.Data.Media.Ranking?]()

    func getMediaStats(mediaId: Int) async {
        isLoading = true
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
        isLoading = false
    }
}
