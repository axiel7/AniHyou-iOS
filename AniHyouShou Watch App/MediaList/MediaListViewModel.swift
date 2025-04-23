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
    var status: [MediaListStatus] = [.current, .repeating]
    var currentPage = 1
    var hasNextPage = false
    @Published var isLoading = false
    @Published var mediaList: [ShouUserMediaList] = []
    @Published var shouldDismiss = false

    func getUserMediaList() async {
        isLoading = true
        if let result = await MediaListRepository.getShouUserMediaList(
            userId: userId,
            mediaType: mediaType,
            statusIn: status,
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

    func updateEntryProgress(of entry: ShouUserMediaList) async {
        let newProgress = (entry.progress ?? 0) + 1
        // Things that have no maxProgress are unfinished and thus can not be set as completed
        let newStatus: MediaListStatus? =
            entry.maxProgress == 0 ? nil :
            (newProgress >= entry.maxProgress ? .completed : nil)
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

            // go back so that the user acknowledges something happened
            shouldDismiss = true
        } else { // update the local cache
            if let updatedItem: ShouUserMediaList = await MediaListRepository.updateCachedEntry(entry) {
                mediaList[foundIndex] = updatedItem
            }
        }
    }
}
