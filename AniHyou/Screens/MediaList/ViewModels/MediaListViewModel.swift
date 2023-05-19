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
    
    private var idMap: Dictionary<String, Bool> = [String : Bool]()
    
    private var mediaSet: Set<UserMediaListQuery.Data.Page.MediaList?> = Set<UserMediaListQuery.Data.Page.MediaList?>()
    
    var currentPage = 1
    var hasNextPage = true
    var forceReload = false
    
    var mediaType: MediaType = .anime
    var mediaListStatus: MediaListStatus = .current
    @Published var sort: MediaListSort = .updatedTimeDesc
    
    func getUserMediaList() {
        Network.shared.apollo.fetch(
            query: UserMediaListQuery(
                page: .some(currentPage),
                perPage: .some(25),
                userId: .some(userId()),
                type: .some(.case(mediaType)),
                status: .some(.case(mediaListStatus)),
                sort: .some([.case(sort)])
            ),
            cachePolicy: forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch
        ) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let list = page.mediaList {
                        list.forEach { self?.mediaSet.insert($0) }
                        
                        if (page.pageInfo?.hasNextPage)! {
                            self?.currentPage += 1
                            self?.hasNextPage = true
                        } else {
                            self?.hasNextPage = false
                        }
                        
                        
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
    
    @Published var updatedEntry = UpdatedMediaEntry()
    @Published var isLoading = false
    
    func updateEntryProgress(entryId: Int, progress: Int) {
        isLoading = true
        Network.shared.apollo.perform(mutation: UpdateEntryProgressMutation(saveMediaListEntryId: .some(entryId), progress: .some(progress))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.saveMediaListEntry {
                    self?.updatedEntry = UpdatedMediaEntry(mediaId: data.id, progress: data.progress)
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
    
}
