//
//  AnimesViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation
import AniListAPI

@MainActor
@Observable class DiscoverAnimeViewModel {
    let nowAnimeSeason = Date.now.getCurrentAnimeSeason()
    let nextAnimeSeason = Date.now.getNextAnimeSeason()

    // MARK: Airing animes
    var airingAnimes = [AiringAnimesQuery.Data.Page.AiringSchedule]()

    func getAiringAnimes(forceReload: Bool = false) async {
        guard forceReload || airingAnimes.isEmpty else { return }
        let todayTimestamp = Int32(Date.now.timeIntervalSince1970)
        
        if let result = await MediaRepository.getAiringAnimes(
            airingAtGreater: todayTimestamp,
            airingAtLesser: nil,
            onMyList: nil,
            sort: [.time],
            page: 1,
            perPage: 15,
            forceReload: forceReload
        ) {
            airingAnimes = result.data
        }
    }

    var airingOnMyList = [AiringOnMyListQuery.Data.Page.Medium]()

    func getAiringOnMyList(forceReload: Bool = false) async {
        guard forceReload || airingOnMyList.isEmpty else { return }
        if let result = await MediaRepository.getAiringOnMyList(
            page: 1,
            forceReload: forceReload
        ) {
            airingOnMyList = result.data
        }
    }

    // MARK: Season animes
    var seasonAnimes = [SeasonalAnimeQuery.Data.Page.Medium]()

    func getSeasonAnimes(forceReload: Bool = false) async {
        guard forceReload || seasonAnimes.isEmpty else { return }
        if let result = await MediaRepository.getAnimeSeasonal(
            season: nowAnimeSeason.season,
            year: Int32(nowAnimeSeason.year),
            sort: [.popularityDesc],
            page: 1,
            perPage: 15
        ) {
            seasonAnimes = result.data
        }
    }

    // MARK: Trending animes
    var pageTrendingAnime: Int32 = 1
    var hasNextPageTrendingAnime = true
    var trendingAnimes = [MediaSortedQuery.Data.Page.Medium]()

    func getTrendingAnimes(forceReload: Bool = false) async {
        guard forceReload || trendingAnimes.isEmpty else { return }
        if let result = await MediaRepository.getMediaSorted(
            sort: [.trendingDesc],
            mediaType: .anime,
            page: pageTrendingAnime,
            perPage: 15,
            forceReload: forceReload
        ) {
            trendingAnimes += result.data
            hasNextPageTrendingAnime = result.hasNextPage
            pageTrendingAnime = result.page
        }
    }

    // MARK: next season
    var nextSeasonAnimes = [SeasonalAnimeQuery.Data.Page.Medium]()

    func getNextSeasonAnimes(forceReload: Bool = false) async {
        guard forceReload || nextSeasonAnimes.isEmpty else { return }
        if let result = await MediaRepository.getAnimeSeasonal(
            season: nextAnimeSeason.season,
            year: Int32(nextAnimeSeason.year),
            sort: [.popularityDesc],
            page: 1,
            perPage: 15
        ) {
            nextSeasonAnimes = result.data
        }
    }
    
    // MARK: Popular anime
    var popularAnime = [MediaSortedQuery.Data.Page.Medium]()
    func getPopularAnime(forceReload: Bool = false) async {
        guard forceReload || popularAnime.isEmpty else { return }
        if let result = await MediaRepository.getMediaSorted(
            sort: [.popularityDesc],
            mediaType: .anime,
            page: 1,
            perPage: 15,
            forceReload: forceReload
        ) {
            popularAnime = result.data
        }
    }
    
    // MARK: Newly anime
    var pageNewlyAnime: Int32 = 1
    var hasNextPageNewlyAnime = true
    var newlyAnime = [MediaSortedQuery.Data.Page.Medium]()
    
    func getNewlyAnime(forceReload: Bool = false) async {
        guard forceReload || newlyAnime.isEmpty else { return }
        if let result = await MediaRepository.getMediaSorted(
            sort: [.idDesc],
            mediaType: .anime,
            page: pageNewlyAnime,
            perPage: 15,
            forceReload: forceReload
        ) {
            newlyAnime += result.data
            hasNextPageNewlyAnime = result.hasNextPage
            pageNewlyAnime = result.page
        }
    }
    
    func onRefresh() async {
        if !airingAnimes.isEmpty {
            await getAiringAnimes(forceReload: true)
        } else if !airingOnMyList.isEmpty {
            await getAiringOnMyList(forceReload: true)
        }
        if !seasonAnimes.isEmpty {
            await getSeasonAnimes(forceReload: true)
        }
        if !trendingAnimes.isEmpty {
            pageTrendingAnime = 1
            hasNextPageTrendingAnime = true
            await getTrendingAnimes(forceReload: true)
        }
        if !nextSeasonAnimes.isEmpty {
            await getNextSeasonAnimes(forceReload: true)
        }
        if !popularAnime.isEmpty {
            await getPopularAnime(forceReload: true)
        }
        if !newlyAnime.isEmpty {
            pageNewlyAnime = 1
            hasNextPageNewlyAnime = true
            await getNewlyAnime(forceReload: true)
        }
    }
}
