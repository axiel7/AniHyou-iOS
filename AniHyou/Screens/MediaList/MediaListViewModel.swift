//
//  MediaListViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import Foundation

class MediaListViewModel: ObservableObject {
    
    @Published var mediaList = [UserMediaListQuery.Data.Page.MediaList?]()
    
    var currentPage = 1
    var hasNextPage = true
    
    func getUserMediaList(type: MediaType, status: MediaListStatus) {
        Network.shared.apollo.fetch(query: UserMediaListQuery(page: currentPage, perPage: 25, userId: userId(), type: type, status: status, sort: [.updatedTimeDesc])) { result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let list = page.mediaList {
                        self.mediaList.append(contentsOf: list)
                        self.currentPage += 1
                        self.hasNextPage = page.pageInfo?.hasNextPage ?? false
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func refreshList() {
        currentPage = 1
        hasNextPage = true
        mediaList = []
    }
    
    func updateEntryProgress(entryId: Int, progress: Int) {
        Network.shared.apollo.perform(mutation: UpdateEntryProgressMutation(saveMediaListEntryId: entryId, progress: progress)) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.saveMediaListEntry {
                    print(data)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
