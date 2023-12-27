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

    var userId: Int = LoginRepository.authUserId()
    @Published var mediaList = [UserMediaListQuery.Data.Page.MediaList?]()
    var selectedItem: UserMediaListQuery.Data.Page.MediaList?

    var currentPage = 1
    var hasNextPage = false
    var forceReload = false

    var mediaType: MediaType = .anime
    var mediaListStatus: MediaListStatus = .current
    private var sort: MediaListSort = .updatedTimeDesc
    
    @Published var formatFilter: MediaFormat?
    @Published var searchText = ""
    @Published var isLoading = false
    
    var filteredMediaList: [UserMediaListQuery.Data.Page.MediaList?] {
        return self.filterMediaList(mediaList: mediaList, filters: [ { mList in
                if !mList.isEmpty {
                    if !self.searchText.isEmpty {
                        let filtered = mList.filter {
                            let title = $0?.media?.title?.userPreferred
                            if title == nil || title?.isEmpty == true {
                                return false
                            }
                            return title!.lowercased().contains(self.searchText.lowercased())
                        }
                        if self.hasNextPage && filtered.count < 25 {
                            self.getUserMediaList(otherUserId: self.userId)
                        }

                        return Array(Set(filtered))
                    }
                }
                return mList
            }, { mList in
                if !mList.isEmpty, let statusFilter = self.statusFilter {
                    return Array(Set(mList.filter { media in
                        return media?.media?.status == statusFilter
                    }))
                }
                return mList
            }
        ])
        
    }
    
    func filterMediaList(
        mediaList: [UserMediaListQuery.Data.Page.MediaList?],
        filters: [(_ media: [UserMediaListQuery.Data.Page.MediaList?]) -> [UserMediaListQuery.Data.Page.MediaList?]]
    ) -> [UserMediaListQuery.Data.Page.MediaList?] {
        var filtered = mediaList
        if !filters.isEmpty {
            filters.forEach { filter in
                filtered = filter(filtered)
            }
        }
        return filtered
    }

    func getUserMediaList(otherUserId: Int?) {
        if let otherUserId { userId = otherUserId }
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

    func updateEntryProgress(mediaId: Int, entryId: Int, progress: Int, status: MediaListStatus?) {
        isLoading = true
        Task {
            let updated = await MediaListRepository.updateProgress(entryId: entryId, progress: progress, status: status)
            if updated {
                onEntryUpdated(mediaId: mediaId, entryId: entryId, updatedEntry: nil, progress: progress)
            }
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
            }
        }
    }

    func onEntryUpdated(mediaId: Int, entryId: Int, updatedEntry: BasicMediaListEntry?, progress: Int?) {
        guard let foundIndex = mediaList.firstIndex(where: { $0?.id == entryId }) else { return }
        //if the status changed, remove from this list
        if let updatedEntry, mediaList[foundIndex]?.status != updatedEntry.status {
            onEntryDeleted(entryId: updatedEntry.id)
            return
        }
        //else update the local cache
        Task {
            let updatedItem = await MediaListRepository.updateCachedEntry(mediaId: mediaId, entryId: entryId)
            DispatchQueue.main.async { [weak self] in
                self?.mediaList[foundIndex] = updatedItem
            }
        }
    }

    func onEntryDeleted(entryId: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.mediaList.removeAll(where: { $0?.id == entryId })
        }
    }

    func onSortChanged(_ newValue: MediaListSort, isAscending: Bool) {
        sort = newValue
        if newValue == .mediaTitleRomajiDesc {
            if
                let preferredLang = UserDefaults.standard.string(forKey: USER_TITLE_LANG_KEY),
                let titleLanguage = UserTitleLanguage(rawValue: preferredLang)
            {
                sort = MediaListSort.titleSortForLanguage(titleLanguage)
            }
        }
        sort = isAscending ? sort.toAscending() : sort
        refreshList()
    }
}
