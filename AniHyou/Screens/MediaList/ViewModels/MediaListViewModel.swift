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
    private var lists: [String: [CommonMediaListEntry]] = [:]
    @Published var mediaList = [CommonMediaListEntry]()
    var selectedDetails: BasicMediaDetails?
    var selectedEntry: BasicMediaListEntry?

    var currentPage = 1
    var hasNextPage = false
    var forceReload = false

    var mediaType: MediaType = .anime
    @Published private(set) var selectedListName: String?
    private var sort: MediaListSort?
    
    @Published var searchText = ""
    @Published var isLoading = false
    
    @Published var showingRandomEntry = false
    var randomId: Int?
    private var entriesIds = [Int]()
    
    func initialize(
        mediaType: MediaType,
        selectedList: String,
        sort: MediaListSort,
        sortAscending: Bool
    ) {
        self.mediaType = mediaType
        self.onChangeList(selectedList)
        self.onSortChanged(sort, isAscending: sortAscending)
    }

    func getUserMediaList(otherUserId: Int?) async {
        if let otherUserId { userId = otherUserId }
        isLoading = true
        let loadByChunk = sort == nil || sort == .updatedTimeDesc
        let chunk: Int? = if loadByChunk { currentPage } else { nil }
        let perChunk: Int? = if loadByChunk { 100 } else { nil }
        if let result = await MediaListRepository.getMediaListCollection(
            userId: userId,
            mediaType: mediaType,
            sort: [sort ?? .updatedTimeDesc],
            chunk: chunk,
            perChunk: perChunk,
            forceReload: forceReload
        ) {
            currentPage = result.page
            hasNextPage = result.hasNextPage
            var newEntries: [CommonMediaListEntry] = []
            result.data.forEach { list in
                if let name = list.name {
                    let entries = list.entries?.compactMap({ $0?.fragments.commonMediaListEntry }) ?? []
                    lists[name] = (lists[name] ?? []) + entries
                    if selectedListName == nil && list.isCustomList == false {
                        newEntries.append(contentsOf: entries)
                    } else if name == selectedListName {
                        newEntries.append(contentsOf: entries)
                    }
                }
            }
            mediaList.append(contentsOf: newEntries)
            if mediaList.isEmpty && result.hasNextPage {
                await getUserMediaList(otherUserId: otherUserId)
            }
        }
        isLoading = false
        forceReload = false
    }

    func refreshList() {
        currentPage = 1
        hasNextPage = true
        forceReload = true
        lists = [:]
        mediaList = []
    }
    
    @Published var filteredMedia = [CommonMediaListEntry]()
    
    func filterList() async {
        if searchText.isEmpty || searchText.count < 3 { return }
        isLoading = true
        filteredMedia = mediaList.filter {
            if let title = $0.media?.title?.userPreferred {
                title.range(of: searchText, options: .caseInsensitive) != nil
            } else {
                false
            }
        }
        isLoading = false
        if hasNextPage {
            await getUserMediaList(otherUserId: userId)
            await filterList()
        }
    }
    
    func onChangeList(_ listName: String) {
        if listName == "All" {
            selectedListName = nil
            mediaList = lists.keys
                .filter { MediaListStatus.listNames.contains($0) }
                .flatMap { lists[$0] ?? [] }
        } else {
            selectedListName = if listName == "Current" {
                mediaType == .anime ? "Watching" : "Reading"
            } else {
                listName
            }
            mediaList = lists[selectedListName!] ?? []
        }
    }

    func updateEntryProgress(of entry: BasicMediaListEntry) async {
        isLoading = true
        var status: MediaListStatus?
        if entry.status == .planning {
            status = .current
        }
        let progress: Int? = if !entry.isVolumeProgress {
            (entry.progress ?? 0) + 1
        } else {
            nil
        }
        let progressVolumes: Int? = if entry.isVolumeProgress {
            (entry.progressVolumes ?? 0) + 1
        } else {
            nil
        }
        if let newEntry = await MediaListRepository.updateProgress(
            entryId: entry.id,
            progress: progress,
            progressVolumes: progressVolumes,
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
            if let updatedItem: CommonMediaListEntry = await MediaListRepository.updateCachedEntry(entry) {
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
    
    func getRandomEntryId(chunk: Int = 1) async {
        if chunk == 1 && !entriesIds.isEmpty {
            randomId = entriesIds.randomElement()
            showingRandomEntry = true
        } else {
            isLoading = true
            if let result = await MediaListRepository.getMediaListIds(
                userId: userId,
                type: mediaType,
                status: selectedListName.asMediaListStatus(),
                chunk: chunk
            ) {
                entriesIds.append(contentsOf: result.data)
                if result.hasNextPage {
                    await getRandomEntryId(chunk: chunk + 1)
                } else {
                    randomId = entriesIds.randomElement()
                    showingRandomEntry = true
                }
            }
            isLoading = false
        }
    }
}
