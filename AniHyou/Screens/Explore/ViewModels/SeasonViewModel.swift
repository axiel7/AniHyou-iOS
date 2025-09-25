//
//  SeasonViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 05/04/2024.
//

import Foundation
import AniListAPI

@Observable class SeasonViewModel {
    
    private let perPage = 25
    static let seasonSorts: [MediaSort] = [.popularityDesc, .scoreDesc, .startDateDesc, .endDateDesc]
    
    var season: MediaSeason = Date.now.season
    var year: Int = Date.now.year
    var sort: MediaSort = .popularityDesc
    var animeSeasonal = [SeasonalAnimeQuery.Data.Page.Medium]()

    var currentPage = 1
    var hasNextPage = false

    func getAnimeSeasonal(resetPage: Bool = false) async {
        if let result = await MediaRepository.getAnimeSeasonal(
            season: season,
            year: year,
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
    
    func resetPage() {
        Task {
            currentPage = 1
            await getAnimeSeasonal(resetPage: true)
        }
    }
}
