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
    private var mediaList = [UserMediaListQuery.Data.Page.MediaList]()
    @Published var filteredMediaList = [UserMediaListQuery.Data.Page.MediaList]()
    var selectedItem: UserMediaListQuery.Data.Page.MediaList?

    var currentPage = 1
    var hasNextPage = false
    var forceReload = false
    
    private var activeRequest: Cancellable?

    var mediaType: MediaType = .anime
    var mediaListStatus: MediaListStatus?
    private var sort: MediaListSort?
    
    @Published var searchText = ""
    @Published var isLoading = false

    func getUserMediaList(otherUserId: Int?) {
        isLoading = true
        if let otherUserId { userId = otherUserId }
        let sortArray: [GraphQLEnum<MediaListSort>] = if mediaListStatus == nil {
            [.case(.status), .case(sort ?? .addedTimeDesc)]
        } else {
            [.case(sort ?? .addedTimeDesc), .case(.mediaIdDesc)]
        }
        activeRequest?.cancel()
        activeRequest = Network.shared.apollo.fetch(
            query: UserMediaListQuery(
                page: .some(currentPage),
                perPage: .some(25),
                userId: .some(userId),
                type: .some(.case(mediaType)),
                status: someIfNotNil(mediaListStatus),
                sort: .some(sortArray)
            ),
            cachePolicy: forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch
        ) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let list = page.mediaList?.compactMap({ $0 }) {
                        self?.mediaList.append(contentsOf: list)
                        self?.filterList()

                        if page.pageInfo?.hasNextPage == true {
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
            self?.isLoading = false
        }
        forceReload = false
    }

    func refreshList() {
        currentPage = 1
        hasNextPage = true
        forceReload = true
        mediaList = []
        filteredMediaList = []
    }
    
    func filterList() {
        if searchText.count > 0 && searchText.count < 3 {
            filteredMediaList = []
        } else if searchText.count >= 3 {
            filteredMediaList = mediaList.filter {
                if let title = $0.media?.title?.userPreferred, !title.isEmpty {
                    return title.lowercased().contains(searchText.lowercased())
                }
                else {
                    return false
                }
            }
            if hasNextPage && filteredMediaList.count < 25 {
                getUserMediaList(otherUserId: userId)
            }
        } else {
            filteredMediaList = mediaList
        }
    }

    func updateEntryProgress(of entry: BasicMediaListEntry) {
        isLoading = true
        Task {
            var status: MediaListStatus?
            if entry.status == .planning {
                status = .current
            }
            if let newEntry = await MediaListRepository.updateProgress(
                entryId: entry.id,
                progress: (entry.progress ?? 0) + 1,
                status: status
            ) {
                await onEntryUpdated(newEntry)
            }
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
            }
        }
    }

    func onEntryUpdated(_ entry: BasicMediaListEntry) async {
        guard let foundIndex = mediaList.firstIndex(where: { $0.id == entry.id }) else { return }
        //if the status changed, remove from this list
        if mediaList[safe: foundIndex]?.status != entry.status {
            onEntryDeleted(entryId: entry.id)
        } else { // update the local cache
            if let updatedItem = await MediaListRepository.updateCachedEntry(entry) {
                DispatchQueue.main.async { [weak self] in
                    self?.mediaList[foundIndex] = updatedItem
                }
            }
        }
    }

    func onEntryDeleted(entryId: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.mediaList.removeAll(where: { $0.id == entryId })
        }
    }

    func onSortChanged(_ newValue: MediaListSort, isAscending: Bool) {
        var newValueOrdered = newValue
        if newValue == .mediaTitleRomajiDesc {
            if
                let preferredLang = UserDefaults.standard.string(forKey: USER_TITLE_LANG_KEY),
                let titleLanguage = UserTitleLanguage(rawValue: preferredLang)
            {
                newValueOrdered = MediaListSort.titleSortForLanguage(titleLanguage)
            }
        }
        newValueOrdered = isAscending ? newValueOrdered.toAscending() : newValueOrdered
        if newValueOrdered != sort {
            sort = newValueOrdered
            refreshList()
        }
    }
}
