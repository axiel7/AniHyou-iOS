//
//  ThreadRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

class ThreadRepository {
    
    static func getThreadDetails(threadId: Int) async -> BasicThreadDetails? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.fetch(query: ThreadDetailsQuery(threadId: .some(threadId))) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.thread?.fragments.basicThreadDetails)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func subscribeToThread(
        threadId: Int,
        subscribe: Bool
    ) async -> Bool? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.perform(
                mutation: SubscribeThreadMutation(
                    threadId: .some(threadId),
                    subscribe: .some(subscribe)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.toggleThreadSubscription?.isSubscribed)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getThreadComments(
        threadId: Int,
        page: Int,
        perPage: Int = 25
    ) async -> PagedResult<ChildCommentsQuery.Data.Page.ThreadComment>? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.fetch(
                query: ChildCommentsQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    threadId: .some(threadId)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let comments = pageData.threadComments?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: comments,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
