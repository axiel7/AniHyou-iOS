//
//  UserRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/03/2024.
//

import Foundation
import AniListAPI
import Apollo

// swiftlint:disable:next type_body_length
struct UserRepository {
    
    static func getUserOptions() async -> UserOptionsFragment? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(query: UserOptionsQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.viewer?.fragments.userOptionsFragment)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func updateUserOptions(
        titleLanguage: UserTitleLanguage? = nil,
        staffNameLanguage: UserStaffNameLanguage? = nil,
        scoreFormat: ScoreFormat? = nil
    ) async -> Bool {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.perform(
                mutation: UpdateUserMutation(
                    displayAdultContent: .none,
                    titleLanguage: someIfNotNil(titleLanguage),
                    staffNameLanguage: someIfNotNil(staffNameLanguage),
                    scoreFormat: someIfNotNil(scoreFormat),
                    airingNotifications: .none,
                    animeListOptions: .none,
                    mangaListOptions: .none
                )
            ) { result in
                switch result {
                case .success:
                    continuation.resume(returning: true)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: false)
                }
            }
        }
    }
    
    static func searchUser(
        search: String,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<SearchUserQuery.Data.Page.User>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: SearchUserQuery(
                    page: .some(1),
                    perPage: .some(perPage),
                    search: .some(search)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let users = pageData.users?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: users,
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
    
    static func getUnreadNotificationsCount() async -> Int? {
        await withUnsafeContinuation { continuation in
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
        page: Int32,
        perPage: Int32 = 20,
        type: NotificationTypeGrouped,
        resetCount: Bool,
        cachePolicy: CachePolicy_v1 = .default
    ) async -> PagedResult<GenericNotification>? {
        await withUnsafeContinuation { continuation in
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
                perPage: Int32(unreadCount),
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
    
    static func getMyUserInfo() async -> UserInfo? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(query: ViewerQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    if let viewer = graphQLResult.data?.viewer?.fragments.userInfo {
                        //update preferences
                        UserDefaults.standard.set(
                            viewer.options?.profileColor?.profileHexColor,
                            forKey: USER_COLOR_KEY
                        )
                        UserDefaults.standard.set(
                            viewer.options?.staffNameLanguage?.value?.rawValue,
                            forKey: USER_NAMES_LANG_KEY
                        )
                        UserDefaults.standard.set(
                            viewer.options?.titleLanguage?.value?.rawValue,
                            forKey: USER_TITLE_LANG_KEY
                        )
                        UserDefaults.standard.set(
                            viewer.mediaListOptions?.scoreFormat?.value?.rawValue,
                            forKey: USER_SCORE_KEY
                        )
                        UserDefaults.standard.setValue(
                            viewer.mediaListOptions?.animeList?.advancedScoringEnabled,
                            forKey: ADVANCED_SCORING_ENABLED_KEY
                        )
                        UserDefaults.standard.setValue(
                            viewer.mediaListOptions?.animeList?.advancedScoring?.compactMap { $0 },
                            forKey: ADVANCED_SCORES_KEY
                        )
                        UserDefaults.standard.setValue(
                            viewer.mediaListOptions?.animeList?.customLists?.compactMap { $0 } ?? [],
                            forKey: ANIME_CUSTOM_LISTS_KEY
                        )
                        UserDefaults.standard.setValue(
                            viewer.mediaListOptions?.mangaList?.customLists?.compactMap { $0 } ?? [],
                            forKey: MANGA_CUSTOM_LISTS_KEY
                        )
                        continuation.resume(returning: viewer)
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
    
    static func getUserInfo(userId: Int32) async -> UserInfo? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(query: UserBasicInfoQuery(userId: .some(userId))) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.user?.fragments.userInfo)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func toggleFollow(userId: Int32) async -> UserInfo? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.perform(mutation: ToggleFollowMutation(userId: .some(userId))) { result in
                switch result {
                case .success(let graphQLResult):
                    if let user = graphQLResult.data?.toggleFollow {
                        Network.shared.apollo.store.withinReadWriteTransaction({ transaction in
                            do {
                                try await transaction.updateObject(
                                    ofType: UserInfo.self,
                                    withKey: "User:\(userId)"
                                ) { (cachedData: inout UserInfo) in
                                    cachedData.isFollowing = user.isFollowing
                                }
                                let newObject = try await transaction.readObject(
                                    ofType: UserInfo.self,
                                    withKey: "User:\(userId)"
                                )
                                continuation.resume(returning: newObject)
                            } catch {
                                print(error)
                                continuation.resume(returning: nil)
                            }
                        })
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
    
    static func getUserActivity(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserActivityQuery.Data.Page.Activity>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                    query: UserActivityQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    userId: .some(userId),
                    sort: .some([.case(.idDesc)])
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
    
    static func getFollowers(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<FollowersQuery.Data.Page.Follower>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: FollowersQuery(
                    userId: userId,
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let followers = pageData.followers?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: followers,
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
    
    static func getFollowings(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<FollowingsQuery.Data.Page.Following>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: FollowingsQuery(
                    userId: userId,
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let following = pageData.following?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: following,
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
}
