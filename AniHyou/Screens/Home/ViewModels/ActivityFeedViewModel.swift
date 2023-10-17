//
//  ActivityFeedViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import Foundation
import AniListAPI

class ActivityFeedViewModel: ObservableObject {
    
    private var currentPage = 1
    var hasNextPage = true
    
    @Published var type = ActivityFeedType.all
    @Published var isFollowing = true
    
    @Published var activities = [ActivityFeedQuery.Data.Page.Activity]()
    
    func getActivities() {
        let typeIn: GraphQLNullable<[GraphQLEnum<ActivityType>?]> =
        if type == .all {
            .none
        } else {
            .some([.case(type.value!)])
        }
        Network.shared.apollo.fetch(
            query: ActivityFeedQuery(
                page: .some(currentPage),
                perPage: .some(25),
                isFollowing: .some(isFollowing),
                typeIn: typeIn
            )
        ) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let pageActivities = page.activities {
                        self?.activities.append(contentsOf: pageActivities.compactMap { $0 })
                    }
                    self?.hasNextPage = page.pageInfo?.hasNextPage == true
                    self?.currentPage += 1
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func refresh() {
        currentPage = 1
        hasNextPage = true
        activities.removeAll()
    }
}
