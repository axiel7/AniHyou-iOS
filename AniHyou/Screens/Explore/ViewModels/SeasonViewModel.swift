//
//  SeasonViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 05/04/2024.
//

import Foundation
@preconcurrency import AniListAPI

@MainActor
@Observable class SeasonViewModel {
    
    static let seasonSorts: [MediaSort] = [.popularityDesc, .scoreDesc, .startDateDesc, .endDateDesc]
    
    var season: MediaSeason = Date.now.season
    var year: Int = Date.now.year
    var sort: MediaSort = .popularityDesc
    var animeSeasonal = [SeasonalAnimeQuery.Data.Page.Medium]()

    var currentPage: Int32 = 1
    var hasNextPage = false

    func getAnimeSeasonal(resetPage: Bool = false) async {
        if let result = await MediaRepository.getAnimeSeasonal(
            season: season,
            year: Int32(year),
            sort: [sort],
            page: currentPage
        ) {
            if resetPage {
                animeSeasonal = result.data
            } else {
                animeSeasonal.append(contentsOf: result.data)
            }
            currentPage = result.page
            hasNextPage = result.hasNextPage
        }
    }
    
    func resetPage() async {
        currentPage = 1
        await getAnimeSeasonal(resetPage: true)
    }
}
