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
class ThreadDetailsViewModel: ObservableObject {

    @Published var details: BasicThreadDetails?
    @Published var threadComments = [ChildCommentsQuery.Data.Page.ThreadComment]()

    var currentPage = 1
    var hasNextPage = true
    
    func getThreadDetails(threadId: Int) async {
        details = await ThreadRepository.getThreadDetails(threadId: threadId)
        hasNextPage = details != nil
    }

    func getThreadComments(threadId: Int) async {
        if let result = await ThreadRepository.getThreadComments(threadId: threadId, page: currentPage) {
            threadComments.append(contentsOf: result.data)
            currentPage = result.page
            hasNextPage = result.hasNextPage
        }
    }
    
    func toggleLikeThread(threadId: Int) async {
        _ = await LikeRepository.toggleLike(likeableId: threadId, likeableType: .thread)
    }
    
    func toggleLikeComment(commentId: Int) async -> Bool? {
        await LikeRepository.toggleLike(likeableId: commentId, likeableType: .threadComment)
    }
}
