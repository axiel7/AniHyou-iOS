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

    @Published var threadComments = [ChildCommentsQuery.Data.Page.ThreadComment?]()

    var currentPage = 1
    var hasNextPage = true

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
        Network.shared.apollo.perform(
            mutation: ToggleLikeMutation(likeableId: .some(threadId), type: .some(.case(.thread)))
        ) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.toggleLikeV2?.asThread {
                    //TODO update cache
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func toggleLikeComment(commentId: Int) {
        Network.shared.apollo.perform(
            mutation: ToggleLikeMutation(likeableId: .some(commentId), type: .some(.case(.threadComment)))
        ) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.toggleLikeV2?.asThreadComment {
                    //TODO update cache
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
