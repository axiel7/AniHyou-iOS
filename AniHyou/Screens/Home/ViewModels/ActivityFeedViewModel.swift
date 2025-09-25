//
//  ActivityFeedViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import Foundation
import AniListAPI

@Observable class ActivityFeedViewModel {
    
    private var currentPage = 1
    var hasNextPage = true
    
    var type = ActivityFeedType.all
    var isFollowing = true
    
    var activities = [ActivityFeedQuery.Data.Page.Activity]()
    
    func getActivities() async {
        if let result = await ActivityRepository.getActivities(
            type: type,
            isFollowing: isFollowing,
            page: currentPage
        ) {
            activities.append(contentsOf: result.data)
            currentPage = result.page
            hasNextPage = result.hasNextPage
        }
    }
    
    func refresh() {
        currentPage = 1
        hasNextPage = true
        activities.removeAll()
    }
}
