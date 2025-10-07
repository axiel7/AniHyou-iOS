//
//  UserRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/03/2024.
//

import Foundation
import AniListAPI
import Apollo

struct UserRepository {

    static func getUserOptions() async -> UserOptionsFragment? {
        do {
            let result = try await Network.shared.apollo.fetch(query: UserOptionsQuery())
            return result.data?.viewer?.fragments.userOptionsFragment
        } catch {
            print(error)
            return nil
        }
    }

    static func updateUserOptions(
        titleLanguage: UserTitleLanguage? = nil,
        staffNameLanguage: UserStaffNameLanguage? = nil,
        scoreFormat: ScoreFormat? = nil
    ) async -> Bool {
        do {
            let result = try await Network.shared.apollo.perform(
                mutation: UpdateUserMutation(
                    displayAdultContent: .none,
                    titleLanguage: someIfNotNil(titleLanguage),
                    staffNameLanguage: someIfNotNil(staffNameLanguage),
                    scoreFormat: someIfNotNil(scoreFormat),
                    airingNotifications: .none,
                    animeListOptions: .none,
                    mangaListOptions: .none
                )
            )
            return result.data != nil
        } catch {
            print(error)
            return false
        }
    }

    // MARK: - User Search

    static func searchUser(
        search: String,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<SearchUserQuery.Data.Page.User>? {
        await Network.fetchPagedResult(
            SearchUserQuery(
                page: .some(page),
                perPage: .some(perPage),
                search: .some(search)
            ),
            extractItems: { $0.page?.users?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }

    // MARK: - Notifications

    static func getUnreadNotificationsCount() async -> Int? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: NotificationCountQuery(),
                cachePolicy: .networkOnly
            )
            return result.data?.viewer?.unreadNotificationCount
        } catch {
            print(error)
            return nil
        }
    }

    static func getNotifications(
        page: Int32,
        perPage: Int32 = 20,
        type: NotificationTypeGrouped,
        resetCount: Bool,
        forceReload: Bool = false
    ) async -> PagedResult<GenericNotification>? {
        let typeIn: GraphQLNullable<[GraphQLEnum<NotificationType>?]> =
            type == .all ? .none : .some(type.value.compactMap { GraphQLEnum($0) })

        return await Network.fetchPagedResult(
            NotificationsQuery(
                page: .some(page),
                perPage: .some(perPage),
                typeIn: typeIn,
                resetNotificationCount: .some(resetCount)
            ),
            forceReload: forceReload,
            extractItems: {
                if page == 1 {
                    DispatchQueue.main.sync {
                        NotificationCenter.default.post(name: "readNotifications", object: nil)
                    }
                }
                return $0.page?.notifications?.compactMap { $0?.toGenericNotification() }
            },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func fetchNewNotifications() async -> [GenericNotification]? {
        let unreadCount = await getUnreadNotificationsCount()
        if let unreadCount, unreadCount > 0 {
            if let notifications = await getNotifications(
                page: 1,
                perPage: Int32(unreadCount),
                type: .all,
                resetCount: false,
                forceReload: true
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
        do {
            let result = try await Network.shared.apollo.fetch(query: ViewerQuery())
            guard let viewer = result.data?.viewer?.fragments.userInfo else { return nil }

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
            return viewer
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getUserInfo(userId: Int32) async -> UserInfo? {
        do {
            let result = try await Network.shared.apollo.fetch(query: UserBasicInfoQuery(userId: .some(userId)))
            return result.data?.user?.fragments.userInfo
        } catch {
            print(error)
            return nil
        }
    }
    
    static func toggleFollow(userId: Int32) async -> UserInfo? {
        do {
            let result = try await Network.shared.apollo.perform(mutation: ToggleFollowMutation(userId: .some(userId)))
            guard let user = result.data?.toggleFollow else { return nil }

            return try await Network.shared.apollo.store.withinReadWriteTransaction { transaction in
                try await transaction.updateObject(
                    ofType: UserInfo.self,
                    withKey: "User:\(userId)"
                ) { (cachedData: inout UserInfo) in
                    cachedData.isFollowing = user.isFollowing
                }
                return try await transaction.readObject(ofType: UserInfo.self, withKey: "User:\(userId)")
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getUserActivity(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserActivityQuery.Data.Page.Activity>? {
        await Network.fetchPagedResult(
            UserActivityQuery(
                page: .some(page),
                perPage: .some(perPage),
                userId: .some(userId),
                sort: .some([.case(.idDesc)])
            ),
            extractItems: { $0.page?.activities?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getFollowers(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<FollowersQuery.Data.Page.Follower>? {
        await Network.fetchPagedResult(
            FollowersQuery(
                userId: userId,
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.page?.followers?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getFollowings(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<FollowingsQuery.Data.Page.Following>? {
        await Network.fetchPagedResult(
            FollowingsQuery(
                userId: userId,
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.page?.following?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
}
