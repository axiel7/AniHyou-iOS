//
//  MediaListViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import Foundation
import Apollo

class MediaListViewModel: ObservableObject {
    
    @Published var mediaList = [UserMediaListQuery.Data.Page.MediaList?]()
    
    var currentPage = 1
    var hasNextPage = true
    var forceReload = false
    
    var mediaType: MediaType = .anime
    var mediaListStatus: MediaListStatus = .current
    @Published var sort: MediaListSort = .updatedTimeDesc
    
    func getUserMediaList() {
        Network.shared.apollo.fetch(query: UserMediaListQuery(page: currentPage, perPage: 25, userId: userId(), type: mediaType, status: mediaListStatus, sort: [sort]), cachePolicy: forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let list = page.mediaList {
                        self?.mediaList.append(contentsOf: list)
                        self?.currentPage += 1
                        self?.hasNextPage = page.pageInfo?.hasNextPage ?? false
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        forceReload = false
    }
    
    func refreshList() {
        currentPage = 1
        hasNextPage = true
        mediaList = []
        forceReload = true
    }
    
    @Published var updatedEntryId: Int? = nil
    var updatedProgress: Int? = nil
    
    func updateEntryProgress(entryId: Int, progress: Int) {
        Network.shared.apollo.perform(mutation: UpdateEntryProgressMutation(saveMediaListEntryId: entryId, progress: progress)) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.saveMediaListEntry {
                    self?.updatedEntryId = data.id
                    self?.updatedProgress = data.progress
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
