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
@Observable class MediaListViewModel {

    var userId: Int = LoginRepository.authUserId()
    var isMyList: Bool = true
    var lists: [String: [CommonMediaListEntry]] = [:]
    var listNames: [String] = []
    var mediaList = [CommonMediaListEntry]()
    var selectedDetails: BasicMediaDetails?
    var selectedEntry: BasicMediaListEntry?

    var forceReload = false

    var mediaType: MediaType = .anime
    var mediaFormat: MediaFormat?
    var mediaStatus: MediaStatus?
    var country: CountryOfOrigin?
    var year: Int?
    
    private(set) var selectedListName: String?
    private var sort: MediaListSort?
    
    var hasFilters: Bool {
        mediaFormat != nil || mediaStatus != nil || country != nil || year != nil
    }
    
    var searchText = ""
    var isLoading = false
    
    var hasQuery: Bool {
        !searchText.isEmpty && searchText.count > 2
    }
    
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
            userId: Int32(userId),
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
                    
                    // follow user section order set in settings
                    if isMyList {
                        fillMyListNames()
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
        if !hasFilters && !hasQuery { return }
        isLoading = true
        filteredMedia = mediaList.filter {
            var titleMatch = true
            if hasQuery, let title = $0.media?.title?.userPreferred {
                titleMatch = title.range(of: searchText, options: .caseInsensitive) != nil
            }
            
            var formatMatch = true
            if let mediaFormat {
                formatMatch = mediaFormat == $0.media?.format?.value
            }
            
            var statusMatch = true
            if let mediaStatus {
                statusMatch = mediaStatus == $0.media?.status?.value
            }
            
            var countryMatch = true
            if let country {
                countryMatch = country == $0.media?.countryOfOrigin
            }
            
            var yearMatch = true
            if let year {
                yearMatch = year == $0.media?.startDate?.year
            }
            
            return titleMatch && formatMatch && statusMatch && countryMatch && yearMatch
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
        MediaListRepository.reloadWidgets()
    }

    func onSortChanged(_ newValue: MediaListSort, isAscending: Bool) async {
        let newValueOrdered = isAscending ? newValue.toAscending() : newValue
        if newValueOrdered != sort {
            sort = newValueOrdered
            await refreshList()
        }
    }
    
    func clearFilters() async {
        mediaFormat = nil
        mediaStatus = nil
        country = nil
        year = nil
        await filterList()
    }
    
    func getRandomEntryId() {
        randomId = if hasFilters {
            filteredMedia.randomElement()?.mediaId
        } else {
            mediaList.randomElement()?.mediaId
        }
        showingRandomEntry = randomId != nil
    }
    
    private func fillMyListNames() {
        if let sectionOrder = UserDefaults.standard.stringArray(forKey: mediaType.sectionOrderKey) {
            // for some reason if the user is using the default order,
            // custom lists aren't included in `sectionOrder`
            let customLists = UserDefaults.standard.stringArray(forKey: mediaType.customListsKey)
            if customLists == nil || customLists?.isEmpty == true {
                listNames = sectionOrder
            } else {
                if let customLists = customLists, sectionOrder.contains(customLists) {
                    listNames = sectionOrder
                } else {
                    listNames = sectionOrder
                    customLists?.forEach {
                        if !listNames.contains($0) { listNames.append($0) }
                    }
                }
            }
        }
    }
}
