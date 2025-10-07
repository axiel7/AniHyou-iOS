//
//  MediaRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/04/2024.
//

import Foundation
import AniListAPI

// swiftlint:disable file_length
// swiftlint:disable:next type_body_length
struct MediaRepository {
    
    static func getMediaSorted(
        sort: [MediaSort],
        mediaType: MediaType,
        page: Int32,
        perPage: Int32 = 25,
        forceReload: Bool = false
    ) async -> PagedResult<MediaSortedQuery.Data.Page.Medium>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: MediaSortedQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    type: .some(.case(mediaType)),
                    sort: .some(sort.map({ .case($0) }))
                ),
                cachePolicy: forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let media = pageData.media?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: media,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getMediaChart(
        type: MediaType,
        sort: MediaSort,
        status: MediaStatus?,
        format: MediaFormat? = nil,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<MediaChartQuery.Data.Page.Medium>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: MediaChartQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    sort: .some([.case(sort)]),
                    type: .some(.case(type)),
                    status: someIfNotNil(status),
                    format: someIfNotNil(format)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let media = pageData.media?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: media,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getAnimeSeasonal(
        season: MediaSeason,
        year: Int32,
        sort: [MediaSort],
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<SeasonalAnimeQuery.Data.Page.Medium>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: SeasonalAnimeQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    season: .some(.case(season)),
                    seasonYear: .some(year),
                    sort: .some(sort.map({ .case($0) }))
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let media = pageData.media?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: media,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getAiringAnimes(
        weekday: Int,
        onMyList: Bool?,
        sort: [AiringSort] = [.time],
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<AiringAnimesQuery.Data.Page.AiringSchedule>? {
        let now = Date.now
        let weekdayStartTimestamp = now.getThisWeekdayTimestamp(weekday: weekday, isEndOfDay: false)
        let weekDayEndTimestamp = now.getThisWeekdayTimestamp(weekday: weekday, isEndOfDay: true)
        return await getAiringAnimes(
            airingAtGreater: Int32(weekdayStartTimestamp),
            airingAtLesser: Int32(weekDayEndTimestamp),
            onMyList: onMyList,
            sort: sort,
            page: page,
            perPage: perPage
        )
    }
    
    static func getAiringAnimes(
        airingAtGreater: Int32?,
        airingAtLesser: Int32?,
        onMyList: Bool?,
        sort: [AiringSort] = [.time],
        page: Int32,
        perPage: Int32 = 25,
        forceReload: Bool = false
    ) async -> PagedResult<AiringAnimesQuery.Data.Page.AiringSchedule>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: AiringAnimesQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    sort: .some(sort.map({ .case($0) })),
                    airingAtGreater: someIfNotNil(airingAtGreater),
                    airingAtLesser: someIfNotNil(airingAtLesser)
                ),
                cachePolicy: forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let schedules = pageData.airingSchedules?.compactMap({ $0 })
                    {
                        let animes = if onMyList == true {
                            schedules.filter({ $0.media?.mediaListEntry != nil })
                        } else if onMyList == false {
                            schedules.filter({ $0.media?.mediaListEntry == nil })
                        } else {
                            schedules
                        }
                        continuation.resume(
                            returning: PagedResult(
                                data: animes,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getAiringOnMyList(
        page: Int32,
        perPage: Int32 = 25,
        forceReload: Bool = false
    ) async -> PagedResult<AiringOnMyListQuery.Data.Page.Medium>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: AiringOnMyListQuery(
                    page: .some(page),
                    perPage: .some(perPage)
                ),
                cachePolicy: forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let media = pageData.media?.compactMap({ $0 })
                        .filter({ $0.nextAiringEpisode != nil })
                        .sorted(by: { it1, it2 in
                            it1.nextAiringEpisode!.airingAt < it2.nextAiringEpisode!.airingAt }
                        )
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: media,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func searchMedia(
        search: String,
        type: MediaType,
        sort: [MediaSort],
        genreIn: [String] = [],
        genreNotIn: [String] = [],
        tagIn: [String] = [],
        tagNotIn: [String] = [],
        formatIn: [MediaFormat] = [],
        statusIn: [MediaStatus] = [],
        startDateGreater: Int? = nil,
        startDateLesser: Int? = nil,
        season: MediaSeason? = nil,
        onList: Bool? = nil,
        isLicensed: Bool? = nil,
        isAdult: Bool? = nil,
        country: CountryOfOrigin? = nil,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<SearchMediaQuery.Data.Page.Medium>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(query: SearchMediaQuery(
                page: .some(1),
                perPage: .some(perPage),
                search: someIfNotEmpty(search),
                type: .some(.case(type)),
                sort: .some(sort.map({ .case($0) })),
                genre_in: someIfNotEmpty(genreIn),
                genre_not_in: someIfNotEmpty(genreNotIn),
                tag_in: someIfNotEmpty(tagIn),
                tag_not_in: someIfNotEmpty(tagNotIn),
                format_in: someEnumArrayIfNotEmpty(formatIn),
                status_in: someEnumArrayIfNotEmpty(statusIn),
                season: someIfNotNil(season),
                startDateGreater: someIfNotNil(startDateGreater?.toFuzzyDateInt()),
                startDateLesser: someIfNotNil(startDateLesser?.toFuzzyDateInt()),
                onList: someIfNotNil(onList),
                isLicensed: someIfNotNil(isLicensed),
                isAdult: someIfNotNil(isAdult),
                country: someIfNotNil(country)
            )) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let media = pageData.media?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: media,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getMediaDetails(mediaId: Int32) async -> MediaDetailsQuery.Data.Media? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(query: MediaDetailsQuery(mediaId: .some(mediaId))) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.media)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getMediaCharactersAndStaff(mediaId: Int32) async -> MediaCharactersAndStaffQuery.Data.Media? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(query: MediaCharactersAndStaffQuery(mediaId: .some(mediaId))) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.media)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getMediaRelationsAndRecommendations(
        mediaId: Int32
    ) async -> MediaRelationsAndRecommendationsQuery.Data.Media? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: MediaRelationsAndRecommendationsQuery(
                    mediaId: .some(mediaId)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.media)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getMediaStats(mediaId: Int32) async -> MediaStatsQuery.Data.Media? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(query: MediaStatsQuery(mediaId: .some(mediaId))) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.media)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getMediaFollowing(
        mediaId: Int32,
        page: Int32,
        perPage: Int32
    ) async -> PagedResult<MediaFollowingQuery.Data.Page.MediaList>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: MediaFollowingQuery(
                    id: .some(mediaId),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data?.page,
                       let media = data.mediaList?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: media,
                                page: page + 1,
                                hasNextPage: data.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getMediaReviews(
        mediaId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<MediaReviewsQuery.Data.Media.Reviews.Node>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: MediaReviewsQuery(
                    mediaId: .some(mediaId),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let reviews = graphQLResult.data?.media?.reviews,
                       let nodes = reviews.nodes?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: nodes,
                                page: page + 1,
                                hasNextPage: reviews.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getMediaThreads(
        mediaId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<BasicThreadDetails>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: MediaThreadsQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    mediaCategoryId: .some(mediaId),
                    sort: .some([.case(.isSticky), .case(.createdAtDesc)])
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                        let threads = pageData.threads?.compactMap({ $0?.fragments.basicThreadDetails })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: threads,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getAnimeThemes(idMal: Int) async -> AnimeThemes? {
        let fields = "opening_themes,ending_themes"
        guard let url = URL(string: "\(MAL_API_URL)anime/\(idMal)?fields=\(fields)") else { return nil }
        
        return await Network.shared.getMalRequest(for: url)
    }
}
// swiftlint:enable file_length
