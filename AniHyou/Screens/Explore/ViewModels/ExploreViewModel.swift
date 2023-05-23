//
//  ExploreViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import Foundation
import API

class ExploreViewModel: ObservableObject {
    
    private let perPage = 25
    
    //MARK: - Charts
    @Published var mediaChart = [MediaChartQuery.Data.Page.Medium?]()
    
    var currentPageChart = 1
    var hasNextPageChart = true
    
    func getMediaChart(type: MediaType, sort: MediaSort) {
        Network.shared.apollo.fetch(query: MediaChartQuery(page: .some(currentPageChart), perPage: .some(perPage), sort: .some([.case(sort)]), type: .some(.case(type)))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let media = page.media {
                        self?.mediaChart.append(contentsOf: media)
                        self?.currentPageChart += 1
                        
                        // limit top 100 results
                        if (page.pageInfo?.currentPage ?? self?.currentPageChart) ?? 1 > 100 / self?.perPage ?? 25 {
                            self?.hasNextPageChart = false
                        } else {
                            self?.hasNextPageChart = page.pageInfo?.hasNextPage ?? false
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - Anime Season
    @Published var animeSeasonal = [SeasonalAnimeQuery.Data.Page.Medium?]()
    
    var currentPageSeason = 1
    var hasNextPageSeason = true
    
    func getAnimeSeasonal(season: MediaSeason, year: Int, resetPage: Bool = false) {
        if resetPage { currentPageSeason = 1 }
        Network.shared.apollo.fetch(query: SeasonalAnimeQuery(page: .some(currentPageSeason), perPage: .some(perPage), season: .some(.case(season)), seasonYear: .some(year), sort: .some([.case(.popularityDesc)]))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let media = page.media {
                        if resetPage {
                            self?.animeSeasonal = media
                        } else {
                            self?.animeSeasonal.append(contentsOf: media)
                        }
                    }
                    self?.currentPageSeason += 1
                    self?.hasNextPageSeason = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
