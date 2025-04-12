//
//  OverviewStatsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/03/2023.
//

import Foundation
import SwiftUI
import AniListAPI

@MainActor
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
        if let length {
            if length.contains("+") { //ex: 101+
                Int(length.replacing("+", with: "")) ?? 0
            } else { //ex: 29-55
                Int(length.split(separator: "-")[0]) ?? 0
            }
        } else { // Unknown length, add last
            Int.max
        }
    }

    // swiftlint:disable:next function_body_length
    func getAnimeOverview(userId: Int) async {
        isLoading = true
        if let result = await UserStatsRepository.getAnimeOverview(userId: userId),
           let scoreFormat = result.mediaListOptions?.scoreFormat?.value,
           let stats = result.statistics?.anime
        {
            animeStats = stats
            self.scoreFormat = scoreFormat

            scoreStatsCount.removeAll()
            scoreStatsTime.removeAll()
            stats.scores?.forEach {
                if let score = $0 {
                    addScoreStat(
                        score: score.score,
                        count: score.count,
                        time: score.minutesWatched / 60
                    )
                }
            }
            stats.lengths?
                .sorted(
                    by: {
                        OverviewStatsViewModel.lengthStatComparator($0?.length)
                        < OverviewStatsViewModel.lengthStatComparator($1?.length)
                    }
                )
                .forEach {
                    if let length = $0 {
                        addLengthStat(
                            length: length.length,
                            count: length.count,
                            time: length.minutesWatched / 60,
                            meanScore: length.meanScore
                        )
                    }
                }
            stats.releaseYears?
                .sorted { $0?.releaseYear ?? 0 > $1?.releaseYear ?? 0 }
                .forEach {
                if let year = $0 {
                    addReleaseYearStat(
                        releaseYear: year.releaseYear,
                        count: year.count,
                        time: year.minutesWatched / 60,
                        meanScore: year.meanScore
                    )
                }
            }
            stats.startYears?
                .sorted { $0?.startYear ?? 0 > $1?.startYear ?? 0 }
                .forEach {
                if let year = $0 {
                    addStartYearStat(
                        startYear: year.startYear,
                        count: year.count,
                        time: year.minutesWatched / 60,
                        meanScore: year.meanScore
                    )
                }
            }
            stats.formats?.forEach {
                if let format = $0 {
                    formatsDistribution.append(
                        Stat(
                            id: format.format?.rawValue ?? "",
                            idLocalized: format.format?.value?.localizedName,
                            value: CGFloat(format.count),
                            color: format.format?.value?.color ?? .accentColor
                        )
                    )
                }
            }
            stats.statuses?.forEach {
                if let status = $0 {
                    statusDistribution.append(
                        Stat(
                            id: status.status?.rawValue ?? "",
                            idLocalized: status.status?.value?.localizedName,
                            value: CGFloat(status.count),
                            color: status.status?.value?.color ?? .accentColor
                        )
                    )
                }
            }
            stats.countries?.forEach {
                if let country = $0 {
                    countryDistribution.append(
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
        isLoading = false
    }

    // swiftlint:disable:next function_body_length
    func getMangaOverview(userId: Int) async {
        isLoading = true
        if let result = await UserStatsRepository.getMangaOverview(userId: userId),
           let scoreFormat = result.mediaListOptions?.scoreFormat?.value,
           let stats = result.statistics?.manga
        {
            mangaStats = stats
            self.scoreFormat = scoreFormat

            scoreStatsCount.removeAll()
            scoreStatsTime.removeAll()
            stats.scores?.forEach {
                if let score = $0 {
                    addScoreStat(
                        score: score.score,
                        count: score.count,
                        time: score.chaptersRead
                    )
                }
            }
            stats.lengths?
                .sorted(
                    by: {
                        OverviewStatsViewModel.lengthStatComparator($0?.length)
                        < OverviewStatsViewModel.lengthStatComparator($1?.length)
                    }
                )
                .forEach {
                    if let length = $0 {
                        addLengthStat(
                            length: length.length,
                            count: length.count,
                            time: length.chaptersRead,
                            meanScore: length.meanScore
                        )
                    }
                }
            stats.releaseYears?
                .sorted { $0?.releaseYear ?? 0 > $1?.releaseYear ?? 0 }
                .forEach {
                if let year = $0 {
                    addReleaseYearStat(
                        releaseYear: year.releaseYear,
                        count: year.count,
                        time: year.chaptersRead,
                        meanScore: year.meanScore
                    )
                }
            }
            stats.startYears?
                .sorted { $0?.startYear ?? 0 > $1?.startYear ?? 0 }
                .forEach {
                if let year = $0 {
                    addStartYearStat(
                        startYear: year.startYear,
                        count: year.count,
                        time: year.chaptersRead,
                        meanScore: year.meanScore
                    )
                }
            }
            stats.formats?.forEach {
                if let format = $0 {
                    formatsDistribution.append(Stat(
                        id: format.format?.rawValue ?? "",
                        idLocalized: format.format?.value?.localizedName,
                        value: CGFloat(format.count),
                        color: format.format?.value?.color ?? .accentColor
                    ))
                }
            }
            stats.statuses?.forEach {
                if let status = $0 {
                    statusDistribution.append(Stat(
                        id: status.status?.rawValue ?? "",
                        idLocalized: status.status?.value?.localizedName,
                        value: CGFloat(status.count),
                        color: status.status?.value?.color ?? .accentColor
                    ))
                }
            }
            stats.countries?.forEach {
                if let country = $0 {
                    countryDistribution.append(
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
        isLoading = false
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
                id: length ?? "??",
                value: CGFloat(count),
                color: .accentColor
            )
        )
        lengthStatsTime.append(
            Stat(
                id: length ?? "??",
                value: CGFloat(time),
                color: .accentColor
            )
        )
        lengthStatsScore.append(
            Stat(
                id: length ?? "??",
                value: CGFloat(meanScore),
                color: .accentColor
            )
        )
    }
    
    private func addReleaseYearStat(releaseYear: Int?, count: Int, time: Int, meanScore: Double) {
        releaseYearStatsCount.append(
            Stat(
                id: releaseYear?.stringValue ?? "??",
                value: CGFloat(count),
                color: .accentColor
            )
        )
        releaseYearStatsTime.append(
            Stat(
                id: releaseYear?.stringValue ?? "??",
                value: CGFloat(time),
                color: .accentColor
            )
        )
        releaseYearStatsScore.append(
            Stat(
                id: releaseYear?.stringValue ?? "??",
                value: CGFloat(meanScore),
                color: .accentColor
            )
        )
    }
    
    private func addStartYearStat(startYear: Int?, count: Int, time: Int, meanScore: Double) {
        startYearStatsCount.append(
            Stat(
                id: startYear?.stringValue ?? "??",
                value: CGFloat(count),
                color: .accentColor
            )
        )
        startYearStatsTime.append(
            Stat(
                id: startYear?.stringValue ?? "??",
                value: CGFloat(time),
                color: .accentColor
            )
        )
        startYearStatsScore.append(
            Stat(
                id: startYear?.stringValue ?? "??",
                value: CGFloat(meanScore),
                color: .accentColor
            )
        )
    }
}
