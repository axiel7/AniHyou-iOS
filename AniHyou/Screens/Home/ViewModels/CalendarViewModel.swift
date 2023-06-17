//
//  CalendarViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 07/01/2023.
//

import Foundation
import AniListAPI

class CalendarViewModel: ObservableObject {
    
    private var now = Date.now
    
    @Published var weeklyAnimes = [AiringAnimesQuery.Data.Page.AiringSchedule?]()
    var currentPage = 1
    var hasNextPage = true
    
    func getAiringAnimes(weekday: Int, onMyList: Bool, resetPage: Bool = false) {
        if resetPage { currentPage = 1 }
        
        let weekdayStartTimestamp = now.getThisWeekdayTimestamp(weekday: weekday, isEndOfDay: false)
        let weekDayEndTimestamp = now.getThisWeekdayTimestamp(weekday: weekday, isEndOfDay: true)
        
        Network.shared.apollo.fetch(query: AiringAnimesQuery(page: .some(currentPage), perPage: .some(25), sort: .some([.case(.time)]), airingAtGreater: .some(weekdayStartTimestamp), airingAtLesser: .some(weekDayEndTimestamp))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let schedules = page.airingSchedules {
                        var animes = schedules
                        if onMyList {
                            animes = schedules.filter({ $0?.media?.mediaListEntry != nil })
                        }
                        if resetPage {
                            self?.weeklyAnimes = animes
                        } else {
                            self?.weeklyAnimes.append(contentsOf: animes)
                        }
                        self?.currentPage += 1
                        self?.hasNextPage = page.pageInfo?.hasNextPage ?? false
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
