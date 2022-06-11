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
    
    @Published var animes = [AnimesQuery.Data.Page.Medium?]()
    
    func getAnimes(page: Int = 0) {
        Network.shared.apollo.fetch(query: AnimesQuery(page: page)) { result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let animes = page.media {
                        self.animes = animes
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: Airing animes
    @Published var todaySchedules = [TodayAiringAnimesQuery.Data.Page.AiringSchedule?]()
    
    func getAiringAnimes(page: Int = 0) {
        let now = Date.now
        let todayTimestamp = Int(now.timeIntervalSince1970)
        
        let calendar = Calendar(identifier: .gregorian)
        let ymd = calendar.dateComponents([.year, .month, .day], from: now)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let todayFinal = dateFormatter.date(from: "\(ymd.year!)-\(ymd.month!)-\(ymd.day!) 23:59:59")
        let todayFinalTimestamp = Int(todayFinal!.timeIntervalSince1970)
        
        Network.shared.apollo.fetch(query: TodayAiringAnimesQuery(page: page, perPage: 10, sort: [AiringSort.time], airingAtGreater: todayTimestamp, airingAtLesser: todayFinalTimestamp)) { result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let schedules = page.airingSchedules {
                        self.todaySchedules = schedules
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: Season animes
    @Published var seasonAnimes = [SeasonalAnimeQuery.Data.Page.Medium?]()
    
    func getSeasonAnimes(page: Int = 0) {
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
}
