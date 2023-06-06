//
//  UserSocialViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/02/2023.
//

import Foundation
import AniListAPI

class UserSocialViewModel: ObservableObject {
    
    @Published var followers = [FollowersQuery.Data.Page.Follower?]()
    private var currentPageFollowers = 1
    var hasNextPageFollowers = true
    
    func getFollowers(userId: Int) {
        Network.shared.apollo.fetch(query: FollowersQuery(userId: userId, page: .some(currentPageFollowers), perPage: .some(25))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let followers = page.followers {
                        self?.followers.append(contentsOf: followers)
                    }
                    self?.currentPageFollowers += 1
                    self?.hasNextPageFollowers = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @Published var followings = [FollowingsQuery.Data.Page.Following?]()
    private var currentPageFollowings = 1
    var hasNextPageFollowings = true
    
    func getFollowings(userId: Int) {
        Network.shared.apollo.fetch(query: FollowingsQuery(userId: userId, page: .some(currentPageFollowings), perPage: .some(25))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let followings = page.following {
                        self?.followings.append(contentsOf: followings)
                    }
                    self?.currentPageFollowings += 1
                    self?.hasNextPageFollowings = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
