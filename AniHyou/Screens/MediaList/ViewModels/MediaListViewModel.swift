//
//  MediaListViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import Foundation
import Apollo
import API

class MediaListViewModel: ObservableObject {
    
    @Published var mediaList = [UserMediaListQuery.Data.Page.MediaList?]()
    var selectedItem: UserMediaListQuery.Data.Page.MediaList? = nil
    
    var currentPage = 1
    var hasNextPage = true
    var forceReload = false
    
    var mediaType: MediaType = .anime
    var mediaListStatus: MediaListStatus = .current
    @Published var sort: MediaListSort = .updatedTimeDesc
    
    func getUserMediaList() {
        Network.shared.apollo.fetch(query: UserMediaListQuery(page: .some(currentPage), perPage: .some(25), userId: .some(userId()), type: .some(.case(mediaType)), status: .some(.case(mediaListStatus)), sort: .some([.case(sort), .case(.mediaIdDesc)])), cachePolicy: forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch) { [weak self] result in
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
    
    @Published var isLoading = false
    
    func updateEntryProgress(entryId: Int, progress: Int) {
        isLoading = true
        Network.shared.apollo.perform(mutation: UpdateEntryProgressMutation(saveMediaListEntryId: .some(entryId), progress: .some(progress))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.saveMediaListEntry {
                    //Update the cache
                    Network.shared.apollo.store.withinReadWriteTransaction({ transaction in
                        do {
                            try transaction.updateObject(ofType: BasicMediaListEntry.self, withKey: "MediaList:\(entryId).\(data.mediaId)") { (cachedData: inout BasicMediaListEntry) in
                                cachedData.progress = data.progress
                            }
                            
                            let newObject = try transaction.readObject(ofType: UserMediaListQuery.Data.Page.MediaList.self, withKey: "MediaList:\(entryId).\(data.mediaId)")
                            if let foundIndex = self?.mediaList.firstIndex(where: { $0?.id == entryId }) {
                                DispatchQueue.main.async {
                                    self?.mediaList[foundIndex] = newObject
                                }
                            }
                        } catch {
                            print(error)
                        }
                    })
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
    
}
