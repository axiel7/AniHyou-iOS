//
//  UserActivityViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation
import AniListAPI

@MainActor
@Observable class UserActivityViewModel {

    var userId: Int?
    var currentPage: Int32 = 1
    var hasNextPage = true
    var isLoading = false

    var activities = [UserActivityQuery.Data.Page.Activity]()

    func getUserActivity(forceReload: Bool = false) async {
        guard let userId, !isLoading, hasNextPage else { return }
        isLoading = true
        defer { isLoading = false }
        if let result = await UserRepository.getUserActivity(
            userId: Int32(userId),
            forceReload: forceReload,
            page: currentPage
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
        hasNextPage = true
        await getUserActivity(forceReload: true)
    }
}
