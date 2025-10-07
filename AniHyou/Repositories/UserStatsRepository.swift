//
//  UserStatsRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

struct UserStatsRepository {
    
    static func getAnimeOverview(
        userId: Int32
    ) async -> UserStatsAnimeOverviewQuery.Data.User? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: UserStatsAnimeOverviewQuery(userId: .some(userId))
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.user)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getMangaOverview(
        userId: Int32
    ) async -> UserStatsMangaOverviewQuery.Data.User? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: UserStatsMangaOverviewQuery(userId: .some(userId))
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.user)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getGenresStats(
        userId: Int32,
        mediaType: MediaType,
        distribution: StatDistributionType
    ) async -> [GenreStat]? {
        await withUnsafeContinuation { continuation in
            let sort = distribution.userStatisticsSort(ascencing: false)
            if mediaType == .anime {
                Network.shared.apollo.fetch(
                    query: UserStatsAnimeGenresQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                ) { result in
                    switch result {
                    case .success(let graphQLResult):
                        continuation.resume(
                            returning: graphQLResult.data?.user?.statistics?.anime?.genres?
                                .compactMap({ $0?.fragments.genreStat })
                        )
                    case .failure(let error):
                        print(error)
                        continuation.resume(returning: nil)
                    }
                }
            } else if mediaType == .manga {
                Network.shared.apollo.fetch(
                    query: UserStatsMangaGenresQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                ) { result in
                    switch result {
                    case .success(let graphQLResult):
                        continuation.resume(
                            returning: graphQLResult.data?.user?.statistics?.manga?.genres?
                                .compactMap { $0?.fragments.genreStat }
                        )
                    case .failure(let error):
                        print(error)
                        continuation.resume(returning: nil)
                    }
                }
            }
        }
    }
    
    static func getTagsStats(
        userId: Int32,
        mediaType: MediaType,
        distribution: StatDistributionType
    ) async -> [TagStat]? {
        await withUnsafeContinuation { continuation in
            let sort = distribution.userStatisticsSort(ascencing: false)
            if mediaType == .anime {
                Network.shared.apollo.fetch(
                    query: UserStatsAnimeTagsQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                ) { result in
                    switch result {
                    case .success(let graphQLResult):
                        continuation.resume(
                            returning: graphQLResult.data?.user?.statistics?.anime?.tags?
                                .compactMap({ $0?.fragments.tagStat })
                        )
                    case .failure(let error):
                        print(error)
                        continuation.resume(returning: nil)
                    }
                }
            } else if mediaType == .manga {
                Network.shared.apollo.fetch(
                    query: UserStatsMangaTagsQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                ) { result in
                    switch result {
                    case .success(let graphQLResult):
                        continuation.resume(
                            returning: graphQLResult.data?.user?.statistics?.manga?.tags?
                                .compactMap { $0?.fragments.tagStat }
                        )
                    case .failure(let error):
                        print(error)
                        continuation.resume(returning: nil)
                    }
                }
            }
        }
    }
    
    static func getStaffStats(
        userId: Int32,
        mediaType: MediaType,
        distribution: StatDistributionType
    ) async -> [StaffStat]? {
        await withUnsafeContinuation { continuation in
            let sort = distribution.userStatisticsSort(ascencing: false)
            if mediaType == .anime {
                Network.shared.apollo.fetch(
                    query: UserStatsAnimeStaffQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                ) { result in
                    switch result {
                    case .success(let graphQLResult):
                        continuation.resume(
                            returning: graphQLResult.data?.user?.statistics?.anime?.staff?
                                .compactMap({ $0?.fragments.staffStat })
                        )
                    case .failure(let error):
                        print(error)
                        continuation.resume(returning: nil)
                    }
                }
            } else if mediaType == .manga {
                Network.shared.apollo.fetch(
                    query: UserStatsMangaStaffQuery(
                        userId: .some(userId),
                        sort: .some([.case(sort)])
                    )
                ) { result in
                    switch result {
                    case .success(let graphQLResult):
                        continuation.resume(
                            returning: graphQLResult.data?.user?.statistics?.manga?.staff?
                                .compactMap { $0?.fragments.staffStat }
                        )
                    case .failure(let error):
                        print(error)
                        continuation.resume(returning: nil)
                    }
                }
            }
        }
    }
    
    static func getVoiceActorsStats(
        userId: Int32,
        distribution: StatDistributionType
    ) async -> [VoiceActorStat]? {
        await withUnsafeContinuation { continuation in
            let sort = distribution.userStatisticsSort(ascencing: false)
            Network.shared.apollo.fetch(
                query: UserStatsVoiceActorsQuery(
                    userId: .some(userId),
                    sort: .some([.case(sort)])
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(
                        returning: graphQLResult.data?.user?.statistics?.anime?.voiceActors?
                            .compactMap { $0?.fragments.voiceActorStat }
                    )
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getStudiosStats(
        userId: Int32,
        distribution: StatDistributionType
    ) async -> [StudioStat]? {
        await withUnsafeContinuation { continuation in
            let sort = distribution.userStatisticsSort(ascencing: false)
            Network.shared.apollo.fetch(
                query: UserStatsStudiosQuery(
                    userId: .some(userId),
                    sort: .some([.case(sort)])
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(
                        returning: graphQLResult.data?.user?.statistics?.anime?.studios?
                            .compactMap { $0?.fragments.studioStat }
                    )
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
