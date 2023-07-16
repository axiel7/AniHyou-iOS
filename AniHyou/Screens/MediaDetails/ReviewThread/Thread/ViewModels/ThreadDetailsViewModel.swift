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

    @Published var threadComments = [ThreadCommentsQuery.Data.Page.ThreadComment?]()

    var currentPage = 1
    var hasNextPage = true

    func getThreadComments(threadId: Int) {
        Network.shared.apollo.fetch(query: ThreadCommentsQuery(
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
}
