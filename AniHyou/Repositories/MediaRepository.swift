//
//  MediaRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/04/2024.
//

import Foundation
import AniListAPI

// swiftlint:disable:next type_body_length
struct MediaRepository {
    
    static func getMediaSorted(
        sort: [MediaSort],
        mediaType: MediaType,
        page: Int32,
        perPage: Int32 = 25,
        forceReload: Bool = false
    ) async -> PagedResult<MediaSortedQuery.Data.Page.Medium>? {
        await Network.fetchPagedResult(
            MediaSortedQuery(
                page: .some(page),
                perPage: .some(perPage),
                type: .some(.case(mediaType)),
                sort: .some(sort.map({ .case($0) }))
            ),
            forceReload: forceReload,
            extractItems: { $0.page?.media?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }

    static func getMediaChart(
        type: MediaType,
        sort: MediaSort,
        status: MediaStatus?,
        format: MediaFormat? = nil,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<MediaChartQuery.Data.Page.Medium>? {
        await Network.fetchPagedResult(
            MediaChartQuery(
                page: .some(page),
                perPage: .some(perPage),
                sort: .some([.case(sort)]),
                type: .some(.case(type)),
                status: someIfNotNil(status),
                format: someIfNotNil(format)
            ),
            extractItems: { $0.page?.media?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }

    static func getAnimeSeasonal(
        season: MediaSeason,
        year: Int32,
        sort: [MediaSort],
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<SeasonalAnimeQuery.Data.Page.Medium>? {
        await Network.fetchPagedResult(
            SeasonalAnimeQuery(
                page: .some(page),
                perPage: .some(perPage),
                season: .some(.case(season)),
                seasonYear: .some(year),
                sort: .some(sort.map { .case($0) })
            ),
            extractItems: { $0.page?.media?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
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
        await Network.fetchPagedResult(
            AiringAnimesQuery(
                page: .some(page),
                perPage: .some(perPage),
                sort: .some(sort.map { .case($0) }),
                airingAtGreater: someIfNotNil(airingAtGreater),
                airingAtLesser: someIfNotNil(airingAtLesser)
            ),
            forceReload: forceReload,
            extractItems: {
                guard let schedules = $0.page?.airingSchedules?.compactMap({ $0 }) else {
                    return nil
                }
                let filtered: [AiringAnimesQuery.Data.Page.AiringSchedule]
                if onMyList == true {
                    filtered = schedules.filter { $0.media?.mediaListEntry != nil }
                } else if onMyList == false {
                    filtered = schedules.filter { $0.media?.mediaListEntry == nil }
                } else {
                    filtered = schedules
                }
                return filtered
            },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }

    static func getAiringOnMyList(
        page: Int32,
        perPage: Int32 = 25,
        forceReload: Bool = false
    ) async -> PagedResult<AiringOnMyListQuery.Data.Page.Medium>? {
        await Network.fetchPagedResult(
            AiringOnMyListQuery(
                page: .some(page),
                perPage: .some(perPage)
            ),
            forceReload: forceReload,
            extractItems: {
                $0.page?.media?
                    .compactMap({ $0 })
                    .filter({ $0.nextAiringEpisode != nil })
                    .sorted(by: { it1, it2 in
                        it1.nextAiringEpisode!.airingAt < it2.nextAiringEpisode!.airingAt }
                    )
            },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
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
        sourceIn: [MediaSource] = [],
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<SearchMediaQuery.Data.Page.Medium>? {
        await Network.fetchPagedResult(
            SearchMediaQuery(
                page: .some(page),
                perPage: .some(perPage),
                search: someIfNotEmpty(search),
                type: .some(.case(type)),
                sort: .some(sort.map { .case($0) }),
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
                country: someIfNotNil(country),
                source_in: someEnumArrayIfNotEmpty(sourceIn)
            ),
            extractItems: { $0.page?.media?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }

    static func getMediaDetails(mediaId: Int32) async -> MediaDetailsQuery.Data.Media? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: MediaDetailsQuery(mediaId: .some(mediaId))
            )
            return result.data?.media
        } catch {
            print(error)
            return nil
        }
    }

    static func getMediaCharactersAndStaff(mediaId: Int32) async -> MediaCharactersAndStaffQuery.Data.Media? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: MediaCharactersAndStaffQuery(mediaId: .some(mediaId))
            )
            return result.data?.media
        } catch {
            print(error)
            return nil
        }
    }

    static func getMediaRelationsAndRecommendations(
        mediaId: Int32
    ) async -> MediaRelationsAndRecommendationsQuery.Data.Media? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: MediaRelationsAndRecommendationsQuery(mediaId: .some(mediaId))
            )
            return result.data?.media
        } catch {
            print(error)
            return nil
        }
    }

    static func getMediaStats(mediaId: Int32) async -> MediaStatsQuery.Data.Media? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: MediaStatsQuery(mediaId: .some(mediaId))
            )
            return result.data?.media
        } catch {
            print(error)
            return nil
        }
    }

    static func getMediaFollowing(
        mediaId: Int32,
        page: Int32,
        perPage: Int32
    ) async -> PagedResult<MediaFollowingQuery.Data.Page.MediaList>? {
        await Network.fetchPagedResult(
            MediaFollowingQuery(
                id: .some(mediaId),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.page?.mediaList?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }

    static func getMediaReviews(
        mediaId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<MediaReviewsQuery.Data.Media.Reviews.Node>? {
        await Network.fetchPagedResult(
            MediaReviewsQuery(
                mediaId: .some(mediaId),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.media?.reviews?.nodes?.compactMap { $0 } },
            extractPage: { $0.media?.reviews?.pageInfo?.fragments.commonPage }
        )
    }

    static func getMediaThreads(
        mediaId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<BasicThreadDetails>? {
        await Network.fetchPagedResult(
            MediaThreadsQuery(
                page: .some(page),
                perPage: .some(perPage),
                mediaCategoryId: .some(mediaId),
                sort: .some([.case(.isSticky), .case(.createdAtDesc)])
            ),
            extractItems: { $0.page?.threads?.compactMap { $0?.fragments.basicThreadDetails } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getAnimeThemes(idMal: Int) async -> AnimeThemes? {
        let fields = "opening_themes,ending_themes"
        guard let url = URL(string: "\(MAL_API_URL)anime/\(idMal)?fields=\(fields)") else { return nil }
        
        return await Network.shared.getMalRequest(for: url)
    }
}
