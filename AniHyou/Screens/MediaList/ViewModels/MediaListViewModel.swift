//
//  MediaListViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import Foundation
import Apollo
import AniListAPI

class MediaListViewModel: ObservableObject {

    var userId: Int = authUserId()
    @Published var mediaList = [UserMediaListQuery.Data.Page.MediaList?]()
    var selectedItem: UserMediaListQuery.Data.Page.MediaList?

    var currentPage = 1
    var hasNextPage = true
    var forceReload = false

    var mediaType: MediaType = .anime
    var mediaListStatus: MediaListStatus = .current
    @Published var sort: MediaListSort = .updatedTimeDesc
    @Published var statusFilter: MediaStatus = .notYetReleased
    @Published var searchText = ""
    @Published var isLoading = false
    
    var filteredMediaList: [UserMediaListQuery.Data.Page.MediaList?] {
        if searchText.isEmpty {
            return mediaList
        } else {
            let filtered = mediaList.filter {
                let title = $0?.media?.title?.userPreferred
                if title == nil || title?.isEmpty == true {
                    return false
                }
                return title!.lowercased().contains(searchText.lowercased())
            }
            if hasNextPage && filtered.count < 25 {
                getUserMediaList(otherUserId: userId)
            }

            return Array(Set(filtered))
        }
    }

    func getUserMediaList(otherUserId: Int?) {
        if otherUserId != nil { userId = otherUserId! }
        Network.shared.apollo.fetch(
            query: UserMediaListQuery(
                page: .some(currentPage),
                perPage: .some(25),
                userId: .some(userId),
                type: .some(.case(mediaType)),
                status: .some(.case(mediaListStatus)),
                sort: .some([.case(sort), .case(.mediaIdDesc)])
            ),
            cachePolicy: forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let list = page.mediaList {
                        self?.mediaList.append(contentsOf: list)

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

    func updateEntryProgress(entryId: Int, progress: Int, status: MediaListStatus?) {
        isLoading = true
        Network.shared.apollo.perform(mutation: UpdateEntryProgressMutation(
            saveMediaListEntryId: .some(entryId),
            progress: .some(progress),
            status: someIfNotNil(status)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data?.saveMediaListEntry {
                    self?.onEntryUpdated(
                        mediaId: data.mediaId,
                        entryId: entryId,
                        updatedEntry: nil,
                        progress: data.progress
                    )
                }
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }

    func onEntryUpdated(mediaId: Int, entryId: Int, updatedEntry: BasicMediaListEntry?, progress: Int?) {
        //Update the local cache
        Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                guard let foundIndex = self?.mediaList.firstIndex(where: { $0?.id == entryId }) else { return }
                //if the status changed, remove from this list
                if updatedEntry != nil && self?.mediaList[foundIndex]?.status != updatedEntry?.status {
                    self?.onEntryDeleted(entryId: updatedEntry!.id)
                    return
                }
                //else update the new entry data
                try transaction.updateObject(
                    ofType: BasicMediaListEntry.self,
                    withKey: "MediaList:\(entryId).\(mediaId)"
                ) { (cachedData: inout BasicMediaListEntry) in
                    if updatedEntry != nil { cachedData = updatedEntry! }
                    if progress != nil { cachedData.progress = progress }
                }

                let newObject = try transaction.readObject(
                    ofType: UserMediaListQuery.Data.Page.MediaList.self,
                    withKey: "MediaList:\(entryId).\(mediaId)"
                )
                DispatchQueue.main.async {
                    self?.mediaList[foundIndex] = newObject
                }
            } catch {
                print(error)
            }
        })
    }

    func onEntryDeleted(entryId: Int) {
        DispatchQueue.main.async {
            self.mediaList.removeAll(where: { $0?.id == entryId })
        }
    }

}
