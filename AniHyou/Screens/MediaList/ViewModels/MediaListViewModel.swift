//
//  MediaListViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import Foundation
import Apollo
import AniListAPI

@MainActor
class MediaListViewModel: ObservableObject {

    var userId: Int = LoginRepository.authUserId()
    private var mediaList = [UserMediaListQuery.Data.Page.MediaList]()
    @Published var filteredMediaList = [UserMediaListQuery.Data.Page.MediaList]()
    var selectedItem: UserMediaListQuery.Data.Page.MediaList?

    var currentPage = 1
    var hasNextPage = false
    var forceReload = false
    
    private var loadingTask: Task<(), Never>?

    var mediaType: MediaType = .anime
    var mediaListStatus: MediaListStatus?
    private var sort: MediaListSort?
    
    @Published var searchText = ""
    @Published var isLoading = false

    func getUserMediaList(otherUserId: Int?) async {
        if let otherUserId { userId = otherUserId }
        if loadingTask != nil {
            _ = await loadingTask?.value
        }
        
        loadingTask = Task {
            await fetchList()
        }
    }
    
    private func fetchList() async {
        isLoading = true
        let sortArray: [MediaListSort] = if mediaListStatus == nil {
            [.status, sort ?? .addedTimeDesc]
        } else {
            [sort ?? .addedTimeDesc, .mediaIdDesc]
        }
        
        if let result = await MediaListRepository.getUserMediaList(
            userId: userId,
            mediaType: mediaType,
            status: mediaListStatus,
            sort: sortArray,
            page: currentPage,
            forceReload: forceReload
        ) {
            currentPage = result.page
            hasNextPage = result.hasNextPage
            mediaList.append(contentsOf: result.data)
            await filterList()
        }
        isLoading = false
        forceReload = false
    }

    func refreshList() {
        currentPage = 1
        hasNextPage = true
        forceReload = true
        mediaList = []
        filteredMediaList = []
    }
    
    func filterList() async {
        if searchText.count > 0 && searchText.count < 3 {
            filteredMediaList = []
        } else if searchText.count >= 3 {
            filteredMediaList = mediaList.filter {
                if let title = $0.media?.title?.userPreferred, !title.isEmpty {
                    return title.lowercased().contains(searchText.lowercased())
                } else {
                    return false
                }
            }
            if hasNextPage && filteredMediaList.count < 25 {
                try? await Task.sleep(for: .seconds(0.5))
                await fetchList()
            }
        } else {
            filteredMediaList = mediaList
        }
    }

    func updateEntryProgress(of entry: BasicMediaListEntry) async {
        isLoading = true
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
        
        isLoading = false
    }

    func onEntryUpdated(_ entry: BasicMediaListEntry) async {
        guard let foundIndex = mediaList.firstIndex(where: { $0.id == entry.id }) else { return }
        //if the status changed, remove from this list
        if mediaList[safe: foundIndex]?.status != entry.status {
            onEntryDeleted(entryId: entry.id)
        } else { // update the local cache
            if let updatedItem = await MediaListRepository.updateCachedEntry(entry) {
                mediaList[foundIndex] = updatedItem
            }
        }
    }

    func onEntryDeleted(entryId: Int) {
        mediaList.removeAll(where: { $0.id == entryId })
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
