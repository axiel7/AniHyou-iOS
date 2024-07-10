//
//  AnimesViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation
import AniListAPI

@MainActor
class DiscoverViewModel: ObservableObject {
    let nowAnimeSeason = Date.now.getCurrentAnimeSeason()
    let nextAnimeSeason = Date.now.getNextAnimeSeason()

    // MARK: Airing animes
    @Published var airingAnimes = [AiringAnimesQuery.Data.Page.AiringSchedule]()

    func getAiringAnimes(page: Int = 1) async {
        let todayTimestamp = Int(Date.now.timeIntervalSince1970)
        
        if let result = await MediaRepository.getAiringAnimes(
            airingAtGreater: todayTimestamp,
            airingAtLesser: nil,
            onMyList: nil,
            sort: [.time],
            page: page,
            perPage: 10
        ) {
            airingAnimes = result.data
        }
    }

    @Published var airingOnMyList = [AiringOnMyListQuery.Data.Page.Medium]()

    func getAiringOnMyList() async {
        if let result = await MediaRepository.getAiringOnMyList(page: 1) {
            airingOnMyList = result.data
        }
    }

    // MARK: Season animes
    @Published var seasonAnimes = [SeasonalAnimeQuery.Data.Page.Medium]()

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
    @Published var trendingAnimes = [MediaSortedQuery.Data.Page.Medium]()

    func getTrendingAnimes(page: Int = 1) async {
        if let result = await MediaRepository.getMediaSorted(
            sort: [.trendingDesc],
            mediaType: .anime,
            page: page,
            perPage: 10
        ) {
            trendingAnimes += result.data
            hasNextPageTrendingAnime = result.hasNextPage
            pageTrendingAnime = result.page
        }
    }

    // MARK: next season
    @Published var nextSeasonAnimes = [SeasonalAnimeQuery.Data.Page.Medium]()

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
    @Published var trendingManga = [MediaSortedQuery.Data.Page.Medium]()

    func getTrendingManga(page: Int = 1) async {
        if let result = await MediaRepository.getMediaSorted(
            sort: [.trendingDesc],
            mediaType: .manga,
            page: page,
            perPage: 10
        ) {
            trendingManga += result.data
            hasNextPageTrendingManga = result.hasNextPage
            pageTrendingManga = result.page
        }
    }
    
    // MARK: Newly anime
    var pageNewlyAnime = 1
    var hasNextPageNewlyAnime = true
    @Published var newlyAnime = [MediaSortedQuery.Data.Page.Medium]()
    
    func getNewlyAnime(page: Int = 1) async {
        if let result = await MediaRepository.getMediaSorted(
            sort: [.idDesc],
            mediaType: .anime,
            page: page,
            perPage: 10
        ) {
            newlyAnime += result.data
            hasNextPageNewlyAnime = result.hasNextPage
            pageNewlyAnime = result.page
        }
    }
    
    // MARK: Newly manga
    var pageNewlyManga = 1
    var hasNextPageNewlyManga = true
    @Published var newlyManga = [MediaSortedQuery.Data.Page.Medium]()
    
    func getNewlyManga(page: Int = 1) async {
        if let result = await MediaRepository.getMediaSorted(
            sort: [.idDesc],
            mediaType: .manga,
            page: page,
            perPage: 10
        ) {
            newlyManga += result.data
            hasNextPageNewlyManga = result.hasNextPage
            pageNewlyManga = result.page
        }
    }
}
