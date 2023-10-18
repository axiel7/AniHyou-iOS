//
//  ThreadDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 6/8/22.
//

import Foundation
import Apollo
import AniListAPI

class ThreadDetailsViewModel: ObservableObject {

    @Published var details: BasicThreadDetails?
    @Published var threadComments = [ChildCommentsQuery.Data.Page.ThreadComment?]()

    var currentPage = 1
    var hasNextPage = false
    
    func getThreadDetails(threadId: Int) {
        Network.shared.apollo.fetch(query: ThreadDetailsQuery(threadId: .some(threadId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let details = graphQLResult.data?.thread?.fragments.basicThreadDetails {
                    self?.details = details
                    self?.hasNextPage = true
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func getThreadComments(threadId: Int) {
        Network.shared.apollo.fetch(query: ChildCommentsQuery(
            page: .some(currentPage),
            perPage: .some(25),
            threadId: .some(threadId)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let comments = page.threadComments {
                        self?.threadComments.append(contentsOf: comments)
                        self?.currentPage += 1
                        self?.hasNextPage = page.pageInfo?.hasNextPage ?? false
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func toggleLikeThread(threadId: Int) {
        Task {
            await LikeRepository.toggleLike(likeableId: threadId, likeableType: .thread)
        }
    }
    
    func toggleLikeComment(commentId: Int) {
        Task {
            await LikeRepository.toggleLike(likeableId: commentId, likeableType: .threadComment)
        }
    }
}
