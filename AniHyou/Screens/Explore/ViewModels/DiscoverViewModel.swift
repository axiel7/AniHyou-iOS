//
//  AnimesViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation
import AniListAPI

@MainActor
@Observable class DiscoverViewModel {
    let nowAnimeSeason = Date.now.getCurrentAnimeSeason()
    let nextAnimeSeason = Date.now.getNextAnimeSeason()

    // MARK: Airing animes
    var airingAnimes = [AiringAnimesQuery.Data.Page.AiringSchedule]()

    func getAiringAnimes(forceReload: Bool = false) async {
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
        if let result = await MediaRepository.getAiringOnMyList(
            page: 1,
            forceReload: forceReload
        ) {
            airingOnMyList = result.data
        }
    }

    // MARK: Season animes
    var seasonAnimes = [SeasonalAnimeQuery.Data.Page.Medium]()

    func getSeasonAnimes(page: Int32 = 1) async {
        if let result = await MediaRepository.getAnimeSeasonal(
            season: nowAnimeSeason.season,
            year: Int32(nowAnimeSeason.year),
            sort: [.popularityDesc],
            page: page,
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

    func getNextSeasonAnimes() async {
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

    // MARK: Trending manga
    var pageTrendingManga: Int32 = 1
    var hasNextPageTrendingManga = true
    var trendingManga = [MediaSortedQuery.Data.Page.Medium]()

    func getTrendingManga(forceReload: Bool = false) async {
        if let result = await MediaRepository.getMediaSorted(
            sort: [.trendingDesc],
            mediaType: .manga,
            page: pageTrendingManga,
            perPage: 15,
            forceReload: forceReload
        ) {
            trendingManga += result.data
            hasNextPageTrendingManga = result.hasNextPage
            pageTrendingManga = result.page
        }
    }
    
    // MARK: Newly anime
    var pageNewlyAnime: Int32 = 1
    var hasNextPageNewlyAnime = true
    var newlyAnime = [MediaSortedQuery.Data.Page.Medium]()
    
    func getNewlyAnime(forceReload: Bool = false) async {
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
    
    // MARK: Newly manga
    var pageNewlyManga: Int32 = 1
    var hasNextPageNewlyManga = true
    var newlyManga = [MediaSortedQuery.Data.Page.Medium]()
    
    func getNewlyManga(forceReload: Bool = false) async {
        if let result = await MediaRepository.getMediaSorted(
            sort: [.idDesc],
            mediaType: .manga,
            page: pageNewlyManga,
            perPage: 15,
            forceReload: forceReload
        ) {
            newlyManga += result.data
            hasNextPageNewlyManga = result.hasNextPage
            pageNewlyManga = result.page
        }
    }
    
    func onRefresh() async {
        if !airingAnimes.isEmpty {
            await getAiringAnimes(forceReload: true)
        } else if !airingOnMyList.isEmpty {
            await getAiringOnMyList(forceReload: true)
        }
        
        if !trendingAnimes.isEmpty {
            pageTrendingAnime = 1
            hasNextPageTrendingAnime = true
            await getTrendingAnimes(forceReload: true)
        }
        if !trendingManga.isEmpty {
            pageTrendingManga = 1
            hasNextPageTrendingManga = true
            await getTrendingManga(forceReload: true)
        }
        
        if !newlyAnime.isEmpty {
            pageNewlyAnime = 1
            hasNextPageNewlyAnime = true
            await getNewlyAnime(forceReload: true)
        }
        if !newlyManga.isEmpty {
            pageNewlyManga = 1
            hasNextPageNewlyManga = true
            await getNewlyManga(forceReload: true)
        }
    }
}
