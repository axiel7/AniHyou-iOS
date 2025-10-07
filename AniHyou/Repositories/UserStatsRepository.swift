//
//  UserStatsRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

struct UserStatsRepository {
    
    static func getAnimeOverview(userId: Int32) async -> UserStatsAnimeOverviewQuery.Data.User? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: UserStatsAnimeOverviewQuery(userId: .some(userId))
            )
            return result.data?.user
        } catch {
            print(error)
            return nil
        }
    }

    static func getMangaOverview(userId: Int32) async -> UserStatsMangaOverviewQuery.Data.User? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: UserStatsMangaOverviewQuery(userId: .some(userId))
            )
            return result.data?.user
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getGenresStats(
        userId: Int32,
        mediaType: MediaType,
        distribution: StatDistributionType
    ) async -> [GenreStat]? {
        let sort = distribution.userStatisticsSort(ascencing: false)
        do {
            if mediaType == .anime {
                let result = try await Network.shared.apollo.fetch(
                    query: UserStatsAnimeGenresQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                )
                return result.data?.user?.statistics?.anime?.genres?.compactMap { $0?.fragments.genreStat }
            } else {
                let result = try await Network.shared.apollo.fetch(
                    query: UserStatsMangaGenresQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                )
                return result.data?.user?.statistics?.manga?.genres?.compactMap { $0?.fragments.genreStat }
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getTagsStats(
        userId: Int32,
        mediaType: MediaType,
        distribution: StatDistributionType
    ) async -> [TagStat]? {
        let sort = distribution.userStatisticsSort(ascencing: false)
        do {
            if mediaType == .anime {
                let result = try await Network.shared.apollo.fetch(
                    query: UserStatsAnimeTagsQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                )
                return result.data?.user?.statistics?.anime?.tags?.compactMap { $0?.fragments.tagStat }
            } else {
                let result = try await Network.shared.apollo.fetch(
                    query: UserStatsMangaTagsQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                )
                return result.data?.user?.statistics?.manga?.tags?.compactMap { $0?.fragments.tagStat }
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getStaffStats(
        userId: Int32,
        mediaType: MediaType,
        distribution: StatDistributionType
    ) async -> [StaffStat]? {
        let sort = distribution.userStatisticsSort(ascencing: false)
        do {
            if mediaType == .anime {
                let result = try await Network.shared.apollo.fetch(
                    query: UserStatsAnimeStaffQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                )
                return result.data?.user?.statistics?.anime?.staff?.compactMap { $0?.fragments.staffStat }
            } else {
                let result = try await Network.shared.apollo.fetch(
                    query: UserStatsMangaStaffQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                )
                return result.data?.user?.statistics?.manga?.staff?.compactMap { $0?.fragments.staffStat }
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getVoiceActorsStats(
        userId: Int32,
        distribution: StatDistributionType
    ) async -> [VoiceActorStat]? {
        let sort = distribution.userStatisticsSort(ascencing: false)
        do {
            let result = try await Network.shared.apollo.fetch(
                query: UserStatsVoiceActorsQuery(
                    userId: .some(userId),
                    sort: .some([.case(sort)])
                )
            )
            return result.data?.user?.statistics?.anime?.voiceActors?.compactMap { $0?.fragments.voiceActorStat }
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getStudiosStats(
        userId: Int32,
        distribution: StatDistributionType
    ) async -> [StudioStat]? {
        let sort = distribution.userStatisticsSort(ascencing: false)
        do {
            let result = try await Network.shared.apollo.fetch(
                query: UserStatsStudiosQuery(
                    userId: .some(userId),
                    sort: .some([.case(sort)])
                )
            )
            return result.data?.user?.statistics?.anime?.studios?.compactMap { $0?.fragments.studioStat }
        } catch {
            print(error)
            return nil
        }
    }
}
