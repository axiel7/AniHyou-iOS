//
//  ThreadDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 6/8/22.
//

import Foundation
import Apollo
import AniListAPI

@MainActor
@Observable class ThreadDetailsViewModel {

    var details: BasicThreadDetails?
    var threadComments = [ChildCommentsQuery.Data.Page.ThreadComment]()

    var currentPage: Int32 = 1
    var hasNextPage = true
    
    func getThreadDetails(threadId: Int) async {
        details = await ThreadRepository.getThreadDetails(threadId: Int32(threadId))
        hasNextPage = details != nil
    }

    func getThreadComments(threadId: Int) async {
        if let result = await ThreadRepository.getThreadComments(threadId: Int32(threadId), page: currentPage) {
            threadComments.append(contentsOf: result.data)
            currentPage = result.page
            hasNextPage = result.hasNextPage
        }
    }
    
    func toggleLikeThread(threadId: Int) async {
        if let liked = await LikeRepository.toggleLike(likeableId: Int32(threadId), likeableType: .thread) {
            await onThreadUpdated(liked: liked)
        }
    }
    
    func toggleLikeComment(commentId: Int) async -> Bool? {
        await LikeRepository.toggleLike(likeableId: Int32(commentId), likeableType: .threadComment)
    }
    
    func subscribeToThread(threadId: Int, subscribe: Bool) async {
        if let subscribed = await ThreadRepository.subscribeToThread(threadId: Int32(threadId), subscribe: subscribe) {
            await onThreadUpdated(subscribed: subscribed)
        }
    }
    
    private func onThreadUpdated(
        liked: Bool? = nil,
        subscribed: Bool? = nil
    ) async {
        guard let thread = details else { return }
        do {
            let newData = try await Network.shared.apollo.store.withinReadWriteTransaction { transaction in
                try await transaction.updateObject(
                    ofType: BasicThreadDetails.self,
                    withKey: "Thread:\(thread.id)"
                ) { (cachedData: inout BasicThreadDetails) in
                    if let liked {
                        cachedData.isLiked = liked
                        if liked {
                            cachedData.likeCount += 1
                        } else {
                            cachedData.likeCount -= 1
                        }
                    }
                    if let subscribed {
                        cachedData.isSubscribed = subscribed
                    }
                }
                
                return try await transaction.readObject(
                    ofType: BasicThreadDetails.self,
                    withKey: "Thread:\(thread.id)"
                )
            }
            self.details = newData
        } catch {
            print(error)
        }
        
    }
}
