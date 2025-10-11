//
//  ActivityFeedViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import Foundation
import AniListAPI

@MainActor
@Observable class ActivityFeedViewModel {
    
    private var currentPage: Int32 = 1
    var hasNextPage = true
    
    var type = ActivityFeedType.all
    var isFollowing = true
    
    var activities = [ActivityFeedQuery.Data.Page.Activity]()
    
    func getActivities(forceReload: Bool = false) async {
        if let result = await ActivityRepository.getActivities(
            type: type,
            isFollowing: isFollowing,
            page: currentPage,
            forceReload: forceReload
        ) {
            activities.append(contentsOf: result.data)
            currentPage = result.page
            hasNextPage = result.hasNextPage
        }
    }
    
    func refresh() async {
        hasNextPage = false
        currentPage = 1
        activities.removeAll()
        await getActivities(forceReload: true)
    }
}
