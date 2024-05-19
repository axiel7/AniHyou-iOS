//
//  MediaListViewModel.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 18/05/2024.
//

import Foundation
import AniListAPI

@MainActor
class MediaListViewModel: ObservableObject {
    
    private let userId = LoginRepository.authUserId()
    
    var mediaType: MediaType = .anime
    var status: MediaListStatus = .current
    
    var currentPage = 1
    var hasNextPage = false
    @Published var isLoading = false
    @Published var mediaList: [CommonUserMediaList] = []
    
    func getUserMediaList() async {
        isLoading = true
        if let result = await MediaListRepository.getUserMediaList(
            userId: userId,
            mediaType: mediaType,
            status: status,
            sort: [.addedTimeDesc],
            page: currentPage,
            perPage: 50
        ) {
            mediaList.append(contentsOf: result.data)
            currentPage = result.page
            hasNextPage = result.hasNextPage
        }
        isLoading = false
    }
    
    func updateEntryProgress(of entry: CommonUserMediaList) async {
        let newProgress = (entry.progress ?? 0) + 1
        let newStatus: MediaListStatus? = newProgress >= entry.maxProgress ? .completed : nil
        if let result = await MediaListRepository.updateProgress(
            entryId: entry.id,
            progress: newProgress,
            status: newStatus
        ) {
            await onEntryUpdated(result)
        }
    }
    
    private func onEntryUpdated(_ entry: BasicMediaListEntry) async {
        guard let foundIndex = mediaList.firstIndex(where: { $0.id == entry.id }) else { return }
        //if the status changed, remove from this list
        if mediaList[safe: foundIndex]?.status != entry.status {
            mediaList.remove(at: foundIndex)
        } else { // update the local cache
            if let updatedItem: CommonUserMediaList = await MediaListRepository.updateCachedEntry(entry) {
                mediaList[foundIndex] = updatedItem
            }
        }
    }
}
