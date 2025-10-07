//
//  CalendarViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 07/01/2023.
//

import Foundation
import AniListAPI

@MainActor
@Observable class CalendarViewModel {

    var weeklyAnimes = [AiringAnimesQuery.Data.Page.AiringSchedule]()
    var currentPage: Int32 = 1
    var hasNextPage = true

    func getAiringAnimes(weekday: Int, onMyList: Bool, resetPage: Bool = false) async {
        if resetPage { currentPage = 1 }
        
        if let result = await MediaRepository.getAiringAnimes(
            weekday: weekday,
            onMyList: onMyList,
            page: currentPage
        ) {
            if resetPage {
                weeklyAnimes = result.data
            } else {
                weeklyAnimes.append(contentsOf: result.data)
            }
            currentPage = result.page
            hasNextPage = result.hasNextPage
        }
    }
}
