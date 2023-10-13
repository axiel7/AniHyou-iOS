//
//  OverviewStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/03/2023.
//

import Foundation
import SwiftUI
import AniListAPI

class OverviewStatsViewModel: ObservableObject {

    @Published var isLoading = false

    @Published var scoreStatsCount = [Stat]()
    @Published var scoreStatsTime = [Stat]()
    @Published var formatsDistribution = [Stat]()
    @Published var statusDistribution = [Stat]()

    @Published var animeStats: UserStatsAnimeOverviewQuery.Data.User.Statistics.Anime?

    func getAnimeOverview(userId: Int) {
        isLoading = true
        Network.shared.apollo.fetch(query: UserStatsAnimeOverviewQuery(userId: .some(userId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.user?.statistics?.anime {
                    self?.animeStats = data

                    self?.scoreStatsCount.removeAll()
                    self?.scoreStatsTime.removeAll()
                    data.scores?.forEach {
                        if let score = $0 {
                            let scoreRounded = Int(round(score.meanScore))
                            self?.scoreStatsCount.append(Stat(
                                id: String(scoreRounded),
                                value: CGFloat(score.count),
                                color: ScoreFormat.point100.scoreColor(score: score.meanScore)
                            ))
                            self?.scoreStatsTime.append(Stat(
                                id: String(scoreRounded),
                                value: CGFloat(score.minutesWatched / 60),
                                color: ScoreFormat.point100.scoreColor(score: score.meanScore)
                            ))
                        }
                    }
                    data.formats?.forEach {
                        if let format = $0 {
                            self?.formatsDistribution.append(Stat(
                                id: format.format?.rawValue ?? "",
                                idLocalized: format.format?.value?.localizedName,
                                value: CGFloat(format.count),
                                color: format.format?.value?.color ?? .accentColor
                            ))
                        }
                    }
                    data.statuses?.forEach {
                        if let status = $0 {
                            self?.statusDistribution.append(Stat(
                                id: status.status?.rawValue ?? "",
                                idLocalized: status.status?.value?.localizedName,
                                value: CGFloat(status.count),
                                color: status.status?.value?.color ?? .accentColor
                            ))
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }

    @Published var mangaStats: UserStatsMangaOverviewQuery.Data.User.Statistics.Manga?

    func getMangaOverview(userId: Int) {
        isLoading = true
        Network.shared.apollo.fetch(query: UserStatsMangaOverviewQuery(userId: .some(userId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.user?.statistics?.manga {
                    self?.mangaStats = data

                    self?.scoreStatsCount.removeAll()
                    self?.scoreStatsTime.removeAll()
                    data.scores?.forEach {
                        if let score = $0 {
                            let scoreRounded = Int(round(score.meanScore))
                            self?.scoreStatsCount.append(Stat(
                                id: String(scoreRounded),
                                value: CGFloat(score.count),
                                color: ScoreFormat.point100.scoreColor(score: score.meanScore)
                            ))
                            self?.scoreStatsTime.append(Stat(
                                id: String(scoreRounded),
                                value: CGFloat(score.chaptersRead),
                                color: ScoreFormat.point100.scoreColor(score: score.meanScore)
                            ))
                        }
                    }
                    data.formats?.forEach {
                        if let format = $0 {
                            self?.formatsDistribution.append(Stat(
                                id: format.format?.rawValue ?? "",
                                idLocalized: format.format?.value?.localizedName,
                                value: CGFloat(format.count),
                                color: format.format?.value?.color ?? .accentColor
                            ))
                        }
                    }
                    data.statuses?.forEach {
                        if let status = $0 {
                            self?.statusDistribution.append(Stat(
                                id: status.status?.rawValue ?? "",
                                idLocalized: status.status?.value?.localizedName,
                                value: CGFloat(status.count),
                                color: status.status?.value?.color ?? .accentColor
                            ))
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
}
