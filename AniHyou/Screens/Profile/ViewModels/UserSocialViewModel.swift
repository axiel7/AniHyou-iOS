//
//  UserSocialViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/02/2023.
//

import Foundation
import AniListAPI

@MainActor
class UserSocialViewModel: ObservableObject {

    @Published var followers = [FollowersQuery.Data.Page.Follower]()
    private var currentPageFollowers = 1
    var hasNextPageFollowers = true

    func getFollowers(userId: Int) async {
        if let result = await UserRepository.getFollowers(userId: userId, page: currentPageFollowers) {
            followers.append(contentsOf: result.data)
            currentPageFollowers = result.page
            hasNextPageFollowers = result.hasNextPage
        }
    }

    @Published var followings = [FollowingsQuery.Data.Page.Following]()
    private var currentPageFollowings = 1
    var hasNextPageFollowings = true

    func getFollowings(userId: Int) async {
        if let result = await UserRepository.getFollowings(userId: userId, page: currentPageFollowings) {
            followings.append(contentsOf: result.data)
            currentPageFollowings = result.page
            hasNextPageFollowings = result.hasNextPage
        }
    }
}
