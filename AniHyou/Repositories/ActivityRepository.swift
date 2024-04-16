//
//  ActivityRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

struct ActivityRepository {
    
    static func getActivities(
        type: ActivityFeedType,
        isFollowing: Bool,
        page: Int,
        perPage: Int = 25
    ) async -> PagedResult<ActivityFeedQuery.Data.Page.Activity>? {
        await withCheckedContinuation { continuation in
            let typeIn: GraphQLNullable<[GraphQLEnum<ActivityType>?]> =
            if type == .all {
                .none
            } else {
                .some([.case(type.value!)])
            }
            Network.shared.apollo.fetch(
                query: ActivityFeedQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    isFollowing: .some(isFollowing),
                    typeIn: typeIn
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let activities = pageData.activities?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: activities,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getActivityDetails(activityId: Int) async -> ActivityDetailsQuery.Data.Activity? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.fetch(query: ActivityDetailsQuery(activityId: .some(activityId))) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.activity)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
