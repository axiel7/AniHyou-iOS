//
//  MediaListViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import Foundation
import Apollo
import AniListAPI

@Observable class MediaListViewModel {

    var userId: Int = LoginRepository.authUserId()
    private var lists: [String: [CommonMediaListEntry]] = [:]
    var listNames: [String] = []
    var mediaList = [CommonMediaListEntry]()
    var selectedDetails: BasicMediaDetails?
    var selectedEntry: BasicMediaListEntry?

    var forceReload = false

    var mediaType: MediaType = .anime
    private(set) var selectedListName: String?
    private var sort: MediaListSort?
    
    var searchText = ""
    var isLoading = false
    
    var showingRandomEntry = false
    var randomId: Int?
    private var entriesIds = [Int]()

    private func getUserMediaList() async {
        isLoading = true
        let sortValue: [MediaListSort] = if sort?.isTitle == true {
            [.mediaId]
        } else {
            [sort ?? .mediaId]
        }
        if let result = await MediaListRepository.getMediaListCollection(
            userId: userId,
            mediaType: mediaType,
            sort: sortValue,
            chunk: nil,
            perChunk: nil,
            forceReload: forceReload
        ) {
            var newEntries: [CommonMediaListEntry] = []
            result.data.forEach { list in
                if let name = list.name {
                    var entries = list.entries?.compactMap({ $0?.fragments.commonMediaListEntry }) ?? []
                    if sort?.isTitle == true {
                        // sort locally bc api is bugged
                        entries = entries.sorted(by: {
                            if sort?.isDesc == true {
                                $0.media?.title?.userPreferred ?? "" > $1.media?.title?.userPreferred ?? ""
                            } else {
                                $0.media?.title?.userPreferred ?? "" < $1.media?.title?.userPreferred ?? ""
                            }
                        })
                    }
                    listNames.append(name)
                    lists[name] = (lists[name] ?? []) + entries
                    if selectedListName == nil && list.isCustomList == false {
                        newEntries.append(contentsOf: entries)
                    } else if name == selectedListName {
                        newEntries.append(contentsOf: entries)
                    }
                }
            }
            mediaList.append(contentsOf: newEntries)
        }
        isLoading = false
        forceReload = false
    }

    func refreshList() async {
        forceReload = true
        lists = [:]
        listNames.removeAll()
        mediaList = []
        await getUserMediaList()
    }
    
    var filteredMedia = [CommonMediaListEntry]()
    
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
    }
    
    func onChangeList(_ listName: String) {
        if listName == "All" {
            selectedListName = nil
            mediaList = lists.keys
                .filter { MediaListStatus.listNames.contains($0) }
                .flatMap { lists[$0] ?? [] }
        } else {
            if let listStatus = MediaListStatus.allCases
                .first(where: { $0.localizedStringKey(type: mediaType) == listName })
            {
                selectedListName = listStatus.localizedStringKey(type: mediaType)
            } else {
                selectedListName = listName
            }
            mediaList = lists[selectedListName!] ?? []
        }
    }

    func updateEntryProgress(
        entry: BasicMediaListEntry,
        details: BasicMediaDetails
    ) async {
        isLoading = true
        if let newEntry = await MediaListRepository.incrementOneProgress(
            of: entry,
            totalProgress: details.maxProgress(isVolume: false),
            totalVolumes: details.maxProgress(isVolume: true)
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

    func onSortChanged(_ newValue: MediaListSort, isAscending: Bool) async {
        let newValueOrdered = isAscending ? newValue.toAscending() : newValue
        if newValueOrdered != sort {
            sort = newValueOrdered
            await refreshList()
        }
    }
    
    func getRandomEntryId() {
        randomId = mediaList.randomElement()?.id
        showingRandomEntry = randomId != nil
    }
}
