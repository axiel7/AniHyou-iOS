//
//  OverviewStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/03/2023.
//

import Foundation
import SwiftUI
import AniListAPI

// swiftlint:disable:next type_body_length
class OverviewStatsViewModel: ObservableObject {

    @Published var isLoading = false

    @Published var scoreStatsCount = [Stat]()
    @Published var scoreStatsTime = [Stat]()
    
    @Published var lengthStatsCount = [Stat]()
    @Published var lengthStatsTime = [Stat]()
    @Published var lengthStatsScore = [Stat]()
    
    @Published var releaseYearStatsCount = [Stat]()
    @Published var releaseYearStatsTime = [Stat]()
    @Published var releaseYearStatsScore = [Stat]()
    
    @Published var startYearStatsCount = [Stat]()
    @Published var startYearStatsTime = [Stat]()
    @Published var startYearStatsScore = [Stat]()
    
    @Published var formatsDistribution = [Stat]()
    @Published var statusDistribution = [Stat]()
    @Published var countryDistribution = [Stat]()

    @Published var animeStats: UserStatsAnimeOverviewQuery.Data.User.Statistics.Anime?
    @Published var mangaStats: UserStatsMangaOverviewQuery.Data.User.Statistics.Manga?
    
    private var scoreFormat: ScoreFormat = .point100
    
    private static func lengthStatComparator(_ length: String?) -> Int {
        if length?.contains("+") == true { //ex: 101+
            return length!.count * 2
        } else { //ex: 29-55 or null
            return length?.count ?? Int.max
        }
    }

    // swiftlint:disable:next function_body_length
    func getAnimeOverview(userId: Int) {
        isLoading = true
        Network.shared.apollo.fetch(query: UserStatsAnimeOverviewQuery(userId: .some(userId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.user?.statistics?.anime,
                   let scoreFormat = graphQLResult.data?.user?.mediaListOptions?.scoreFormat?.value
                {
                    self?.animeStats = data
                    self?.scoreFormat = scoreFormat

                    self?.scoreStatsCount.removeAll()
                    self?.scoreStatsTime.removeAll()
                    data.scores?.forEach {
                        if let score = $0 {
                            self?.addScoreStat(
                                score: score.score,
                                count: score.count,
                                time: score.minutesWatched / 60
                            )
                        }
                    }
                    data.lengths?
                        .sorted(
                            by: {
                                OverviewStatsViewModel.lengthStatComparator($0?.length) 
                                < OverviewStatsViewModel.lengthStatComparator($1?.length)
                            }
                        )
                        .forEach {
                            if let length = $0 {
                                self?.addLengthStat(
                                    length: length.length,
                                    count: length.count,
                                    time: length.minutesWatched / 60,
                                    meanScore: length.meanScore
                                )
                            }
                        }
                    data.releaseYears?.forEach {
                        if let year = $0 {
                            self?.addReleaseYearStat(
                                releaseYear: year.releaseYear,
                                count: year.count,
                                time: year.minutesWatched / 60,
                                meanScore: year.meanScore
                            )
                        }
                    }
                    data.startYears?.forEach {
                        if let year = $0 {
                            self?.addStartYearStat(
                                startYear: year.startYear,
                                count: year.count,
                                time: year.minutesWatched / 60,
                                meanScore: year.meanScore
                            )
                        }
                    }
                    data.formats?.forEach {
                        if let format = $0 {
                            self?.formatsDistribution.append(
                                Stat(
                                    id: format.format?.rawValue ?? "",
                                    idLocalized: format.format?.value?.localizedName,
                                    value: CGFloat(format.count),
                                    color: format.format?.value?.color ?? .accentColor
                                )
                            )
                        }
                    }
                    data.statuses?.forEach {
                        if let status = $0 {
                            self?.statusDistribution.append(
                                Stat(
                                    id: status.status?.rawValue ?? "",
                                    idLocalized: status.status?.value?.localizedName,
                                    value: CGFloat(status.count),
                                    color: status.status?.value?.color ?? .accentColor
                                )
                            )
                        }
                    }
                    data.countries?.forEach {
                        if let country = $0 {
                            self?.countryDistribution.append(
                                Stat(
                                    id: country.country?.rawValue ?? "",
                                    idLocalized: country.country?.localizedName,
                                    value: CGFloat(country.count),
                                    color: country.country?.color ?? .accentColor
                                )
                            )
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }

    // swiftlint:disable:next function_body_length
    func getMangaOverview(userId: Int) {
        isLoading = true
        Network.shared.apollo.fetch(query: UserStatsMangaOverviewQuery(userId: .some(userId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.user?.statistics?.manga,
                   let scoreFormat = graphQLResult.data?.user?.mediaListOptions?.scoreFormat?.value
                {
                    self?.mangaStats = data
                    self?.scoreFormat = scoreFormat

                    self?.scoreStatsCount.removeAll()
                    self?.scoreStatsTime.removeAll()
                    data.scores?.forEach {
                        if let score = $0 {
                            self?.addScoreStat(
                                score: score.score,
                                count: score.count,
                                time: score.chaptersRead
                            )
                        }
                    }
                    data.lengths?
                        .sorted(
                            by: {
                                OverviewStatsViewModel.lengthStatComparator($0?.length) 
                                < OverviewStatsViewModel.lengthStatComparator($1?.length)
                            }
                        )
                        .forEach {
                            if let length = $0 {
                                self?.addLengthStat(
                                    length: length.length,
                                    count: length.count,
                                    time: length.chaptersRead,
                                    meanScore: length.meanScore
                                )
                            }
                        }
                    data.releaseYears?.forEach {
                        if let year = $0 {
                            self?.addReleaseYearStat(
                                releaseYear: year.releaseYear,
                                count: year.count,
                                time: year.chaptersRead,
                                meanScore: year.meanScore
                            )
                        }
                    }
                    data.startYears?.forEach {
                        if let year = $0 {
                            self?.addStartYearStat(
                                startYear: year.startYear,
                                count: year.count,
                                time: year.chaptersRead,
                                meanScore: year.meanScore
                            )
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
                    data.countries?.forEach {
                        if let country = $0 {
                            self?.countryDistribution.append(
                                Stat(
                                    id: country.country?.rawValue ?? "",
                                    idLocalized: country.country?.localizedName,
                                    value: CGFloat(country.count),
                                    color: country.country?.color ?? .accentColor
                                )
                            )
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
    
    private func addScoreStat(score: Int?, count: Int, time: Int) {
        let scoreInt = if scoreFormat == .point10Decimal {
            score?.div(10)
        } else {
            score
        }
        scoreStatsCount.append(
            Stat(
                id: String(score ?? 0),
                value: CGFloat(count),
                color: scoreFormat.color(score: scoreInt)
            )
        )
        scoreStatsTime.append(
            Stat(
                id: String(score ?? 0),
                value: CGFloat(time),
                color: scoreFormat.color(score: scoreInt)
            )
        )
    }
    
    private func addLengthStat(length: String?, count: Int, time: Int, meanScore: Double) {
        lengthStatsCount.append(
            Stat(
                id: length ?? "",
                value: CGFloat(count),
                color: .accentColor
            )
        )
        lengthStatsTime.append(
            Stat(
                id: length ?? "",
                value: CGFloat(time),
                color: .accentColor
            )
        )
        lengthStatsScore.append(
            Stat(
                id: length ?? "",
                value: CGFloat(meanScore),
                color: .accentColor
            )
        )
    }
    
    private func addReleaseYearStat(releaseYear: Int?, count: Int, time: Int, meanScore: Double) {
        releaseYearStatsCount.append(
            Stat(
                id: releaseYear?.stringValue ?? "",
                value: CGFloat(count),
                color: .accentColor
            )
        )
        releaseYearStatsTime.append(
            Stat(
                id: releaseYear?.stringValue ?? "",
                value: CGFloat(time),
                color: .accentColor
            )
        )
        releaseYearStatsScore.append(
            Stat(
                id: releaseYear?.stringValue ?? "",
                value: CGFloat(meanScore),
                color: .accentColor
            )
        )
    }
    
    private func addStartYearStat(startYear: Int?, count: Int, time: Int, meanScore: Double) {
        startYearStatsCount.append(
            Stat(
                id: startYear?.stringValue ?? "",
                value: CGFloat(count),
                color: .accentColor
            )
        )
        startYearStatsTime.append(
            Stat(
                id: startYear?.stringValue ?? "",
                value: CGFloat(time),
                color: .accentColor
            )
        )
        startYearStatsScore.append(
            Stat(
                id: startYear?.stringValue ?? "",
                value: CGFloat(meanScore),
                color: .accentColor
            )
        )
    }
}
