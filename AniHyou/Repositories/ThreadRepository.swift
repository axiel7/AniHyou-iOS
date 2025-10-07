//
//  ThreadRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

struct ThreadRepository {
    
    static func getThreadDetails(threadId: Int32) async -> BasicThreadDetails? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: ThreadDetailsQuery(threadId: .some(threadId))
            )
            return result.data?.thread?.fragments.basicThreadDetails
        } catch {
            print(error)
            return nil
        }
    }
    
    static func subscribeToThread(
        threadId: Int32,
        subscribe: Bool
    ) async -> Bool? {
        do {
            let result = try await Network.shared.apollo.perform(
                mutation: SubscribeThreadMutation(
                    threadId: .some(threadId),
                    subscribe: .some(subscribe)
                )
            )
            return result.data?.toggleThreadSubscription?.isSubscribed
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getThreadComments(
        threadId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<ChildCommentsQuery.Data.Page.ThreadComment>? {
        await Network.fetchPagedResult(
            ChildCommentsQuery(
                page: .some(page),
                perPage: .some(perPage),
                threadId: .some(threadId)
            ),
            extractItems: { $0.page?.threadComments?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
}
