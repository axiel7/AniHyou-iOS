//
//  UserRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/03/2024.
//

import Foundation
import AniListAPI
import Apollo

class UserRepository {
    
    static func getUnreadNotificationsCount() async -> Int? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.fetch(
                query: NotificationCountQuery(),
                cachePolicy: .fetchIgnoringCacheCompletely
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.viewer?.unreadNotificationCount)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getNotifications(
        page: Int,
        perPage: Int = 20,
        type: NotificationTypeGrouped,
        resetCount: Bool,
        cachePolicy: CachePolicy = .default
    ) async -> PagedResult<GenericNotification>? {
        await withCheckedContinuation { continuation in
            var typeIn: GraphQLNullable<[GraphQLEnum<NotificationType>?]> =
                .some(type.value.compactMap { GraphQLEnum($0) })
            if type == .all {
                typeIn = .none
            }
            Network.shared.apollo.fetch(
                query: NotificationsQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    typeIn: typeIn,
                    resetNotificationCount: .some(resetCount)
                ),
                cachePolicy: cachePolicy
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page {
                        if let notifications = pageData.notifications?.compactMap({ $0?.toGenericNotification() }) {
                            if page == 1 {
                                NotificationCenter.default.post(name: "readNotifications", object: nil)
                            }
                            continuation.resume(
                                returning: PagedResult(
                                    data: notifications,
                                    page: page + 1,
                                    hasNextPage: pageData.pageInfo?.hasNextPage ?? false
                                )
                            )
                        } else {
                            continuation.resume(returning: nil)
                        }
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func fetchNewNotifications() async -> [GenericNotification]? {
        let unreadCount = await getUnreadNotificationsCount()
        if let unreadCount, unreadCount > 0 {
            if let notifications = await getNotifications(
                page: 1,
                perPage: unreadCount,
                type: .all,
                resetCount: false,
                cachePolicy: .fetchIgnoringCacheData
            )?.data {
                let lastCreatedAt = UserDefaults.standard.integer(forKey: LAST_NOTIFICATION_CREATED_AT_KEY)
                let newNotifications = notifications.filter {
                    $0.createdAt > lastCreatedAt
                }
                if !newNotifications.isEmpty {
                    UserDefaults.standard.setValue(
                        newNotifications[0].createdAt,
                        forKey: LAST_NOTIFICATION_CREATED_AT_KEY
                    )
                }
                return newNotifications
            }
        }
        return unreadCount != nil ? [] : nil
    }
}
