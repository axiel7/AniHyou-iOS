//
//  AnimesViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation
import AniListAPI

@MainActor
@Observable class DiscoverMangaViewModel {

    // MARK: Trending manga
    var pageTrendingManga: Int32 = 1
    var hasNextPageTrendingManga = true
    var trendingManga = [MediaSortedQuery.Data.Page.Medium]()

    func getTrendingManga(forceReload: Bool = false) async {
        guard forceReload || trendingManga.isEmpty else { return }
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
    
    // MARK: Popular manga
    var popularManga = [MediaSortedQuery.Data.Page.Medium]()
    func getPopularManga(forceReload: Bool = false) async {
        guard forceReload || popularManga.isEmpty else { return }
        if let result = await MediaRepository.getMediaSorted(
            sort: [.popularityDesc],
            mediaType: .manga,
            page: 1,
            perPage: 15,
            forceReload: forceReload
        ) {
            popularManga = result.data
        }
    }
    
    // MARK: Popular manhwa
    var popularManhwa = [MediaSortedQuery.Data.Page.Medium]()
    func getPopularManhwa(forceReload: Bool = false) async {
        guard forceReload || popularManhwa.isEmpty else { return }
        if let result = await MediaRepository.getMediaSorted(
            sort: [.popularityDesc],
            mediaType: .manga,
            country: .southKorea,
            page: 1,
            perPage: 15,
            forceReload: forceReload
        ) {
            popularManhwa = result.data
        }
    }
    
    // MARK: Newly manga
    var pageNewlyManga: Int32 = 1
    var hasNextPageNewlyManga = true
    var newlyManga = [MediaSortedQuery.Data.Page.Medium]()
    
    func getNewlyManga(forceReload: Bool = false) async {
        guard forceReload || newlyManga.isEmpty else { return }
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
        if !trendingManga.isEmpty {
            pageTrendingManga = 1
            hasNextPageTrendingManga = true
            await getTrendingManga(forceReload: true)
        }
        if !popularManga.isEmpty {
            await getPopularManga(forceReload: true)
        }
        if !popularManhwa.isEmpty {
            await getPopularManhwa(forceReload: true)
        }
        if !newlyManga.isEmpty {
            pageNewlyManga = 1
            hasNextPageNewlyManga = true
            await getNewlyManga(forceReload: true)
        }
    }
}
