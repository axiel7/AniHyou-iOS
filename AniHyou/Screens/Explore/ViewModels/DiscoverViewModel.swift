//
//  AnimesViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation
import AniListAPI

@Observable class DiscoverViewModel {
    let nowAnimeSeason = Date.now.getCurrentAnimeSeason()
    let nextAnimeSeason = Date.now.getNextAnimeSeason()

    // MARK: Airing animes
    var airingAnimes = [AiringAnimesQuery.Data.Page.AiringSchedule]()

    func getAiringAnimes(page: Int = 1, forceReload: Bool = false) async {
        let todayTimestamp = Int(Date.now.timeIntervalSince1970)
        
        if let result = await MediaRepository.getAiringAnimes(
            airingAtGreater: todayTimestamp,
            airingAtLesser: nil,
            onMyList: nil,
            sort: [.time],
            page: page,
            perPage: 10,
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

    func getSeasonAnimes(page: Int = 1) async {
        if let result = await MediaRepository.getAnimeSeasonal(
            season: nowAnimeSeason.season,
            year: nowAnimeSeason.year,
            sort: [.popularityDesc],
            page: page,
            perPage: 10
        ) {
            seasonAnimes = result.data
        }
    }

    // MARK: Trending animes
    var pageTrendingAnime = 1
    var hasNextPageTrendingAnime = true
    var trendingAnimes = [MediaSortedQuery.Data.Page.Medium]()

    func getTrendingAnimes(page: Int = 1, forceReload: Bool = false) async {
        if let result = await MediaRepository.getMediaSorted(
            sort: [.trendingDesc],
            mediaType: .anime,
            page: page,
            perPage: 10,
            forceReload: forceReload
        ) {
            trendingAnimes += result.data
            hasNextPageTrendingAnime = result.hasNextPage
            pageTrendingAnime = result.page
        }
    }

    // MARK: next season
    var nextSeasonAnimes = [SeasonalAnimeQuery.Data.Page.Medium]()

    func getNextSeasonAnimes(page: Int = 1) async {
        if let result = await MediaRepository.getAnimeSeasonal(
            season: nextAnimeSeason.season,
            year: nextAnimeSeason.year,
            sort: [.popularityDesc],
            page: page,
            perPage: 10
        ) {
            nextSeasonAnimes = result.data
        }
    }

    // MARK: Trending manga
    var pageTrendingManga = 1
    var hasNextPageTrendingManga = true
    var trendingManga = [MediaSortedQuery.Data.Page.Medium]()

    func getTrendingManga(page: Int = 1, forceReload: Bool = false) async {
        if let result = await MediaRepository.getMediaSorted(
            sort: [.trendingDesc],
            mediaType: .manga,
            page: page,
            perPage: 10,
            forceReload: forceReload
        ) {
            trendingManga += result.data
            hasNextPageTrendingManga = result.hasNextPage
            pageTrendingManga = result.page
        }
    }
    
    // MARK: Newly anime
    var pageNewlyAnime = 1
    var hasNextPageNewlyAnime = true
    var newlyAnime = [MediaSortedQuery.Data.Page.Medium]()
    
    func getNewlyAnime(page: Int = 1, forceReload: Bool = false) async {
        if let result = await MediaRepository.getMediaSorted(
            sort: [.idDesc],
            mediaType: .anime,
            page: page,
            perPage: 10,
            forceReload: forceReload
        ) {
            newlyAnime += result.data
            hasNextPageNewlyAnime = result.hasNextPage
            pageNewlyAnime = result.page
        }
    }
    
    // MARK: Newly manga
    var pageNewlyManga = 1
    var hasNextPageNewlyManga = true
    var newlyManga = [MediaSortedQuery.Data.Page.Medium]()
    
    func getNewlyManga(page: Int = 1, forceReload: Bool = false) async {
        if let result = await MediaRepository.getMediaSorted(
            sort: [.idDesc],
            mediaType: .manga,
            page: page,
            perPage: 10,
            forceReload: forceReload
        ) {
            newlyManga += result.data
            hasNextPageNewlyManga = result.hasNextPage
            pageNewlyManga = result.page
        }
    }
    
    func onRefresh() async {
        if !airingAnimes.isEmpty {
            await getAiringAnimes(page: 1, forceReload: true)
        } else if !airingOnMyList.isEmpty {
            await getAiringOnMyList(forceReload: true)
        }
        
        if !trendingAnimes.isEmpty {
            pageTrendingAnime = 1
            hasNextPageTrendingAnime = true
            await getTrendingAnimes(page: 1, forceReload: true)
        }
        if !trendingManga.isEmpty {
            pageTrendingManga = 1
            hasNextPageTrendingManga = true
            await getTrendingManga(page: 1, forceReload: true)
        }
        
        if !newlyAnime.isEmpty {
            pageNewlyAnime = 1
            hasNextPageNewlyAnime = true
            await getNewlyAnime(page: 1, forceReload: true)
        }
        if !newlyManga.isEmpty {
            pageNewlyManga = 1
            hasNextPageNewlyManga = true
            await getNewlyManga(page: 1, forceReload: true)
        }
    }
}
