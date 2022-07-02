//
//  AnimesViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let now = Date.now
    @Published var nowYear = 2022
    @Published var nowSeason = MediaSeason.spring
    
    init() {
        nowYear = now.year
        nowSeason = now.season
    }
    
    // MARK: Airing animes
    @Published var airingAnimes = [AiringAnimesQuery.Data.Page.AiringSchedule?]()
    
    func getAiringAnimes(page: Int = 1) {
        let todayTimestamp = Int(Date.now.timeIntervalSince1970)
        
        Network.shared.apollo.fetch(query: AiringAnimesQuery(page: page, perPage: 10, sort: [AiringSort.time], airingAtGreater: todayTimestamp)) { result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let schedules = page.airingSchedules {
                        self.airingAnimes = schedules
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: Season animes
    @Published var seasonAnimes = [SeasonalAnimeQuery.Data.Page.Medium?]()
    
    func getSeasonAnimes(page: Int = 1) {
        Network.shared.apollo.fetch(query: SeasonalAnimeQuery(page: page, perPage: 10, season: nowSeason, seasonYear: nowYear, sort: [MediaSort.popularityDesc])) { result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let animes = page.media {
                        self.seasonAnimes = animes
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: Trending animes
    @Published var trendingAnimes = [AnimesQuery.Data.Page.Medium?]()
    
    func getTrendingAnimes(page: Int = 1) {
        Network.shared.apollo.fetch(query: AnimesQuery(page: page, perPage: 10, sort: [.trendingDesc])) { result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let animes = page.media {
                        self.trendingAnimes = animes
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
