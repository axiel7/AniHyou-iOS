//
//  UserActivityViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation
import AniListAPI

@Observable class UserActivityViewModel {

    var currentPage = 1
    var hasNextPage = true

    var activities = [UserActivityQuery.Data.Page.Activity]()

    func getUserActivity(userId: Int) async {
        if let result = await UserRepository.getUserActivity(userId: userId, page: currentPage) {
            activities.append(contentsOf: result.data)
            currentPage = result.page
            hasNextPage = result.hasNextPage
        }
    }
}
