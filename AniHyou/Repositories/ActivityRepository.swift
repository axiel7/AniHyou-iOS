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
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<ActivityFeedQuery.Data.Page.Activity>? {
        let typeIn: GraphQLNullable<[GraphQLEnum<ActivityType>?]> =
            type == .all ? .none : .some([.case(type.value!)])
        
        return await Network.fetchPagedResult(
            ActivityFeedQuery(
                page: .some(page),
                perPage: .some(perPage),
                isFollowing: .some(isFollowing),
                typeIn: typeIn
            ),
            extractItems: { $0.page?.activities?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getActivityDetails(activityId: Int32) async -> ActivityDetailsQuery.Data.Activity? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: ActivityDetailsQuery(activityId: .some(activityId))
            )
            return result.data?.activity
        } catch {
            print(error)
            return nil
        }
    }
}
