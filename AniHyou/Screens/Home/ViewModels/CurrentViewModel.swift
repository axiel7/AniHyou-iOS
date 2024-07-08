//
//  CurrentViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/07/2024.
//

import Foundation
import AniListAPI

@MainActor
class CurrentViewModel: ObservableObject {
    
    @Published var animeList: [CommonMediaListEntry] = []
    @Published var mangaList: [CommonMediaListEntry] = []
    
    func getMediaList(mediaType: MediaType) async {
        if let result = await MediaListRepository.getUserMediaList(
            userId: LoginRepository.authUserId(),
            mediaType: mediaType,
            status: .current,
            sort: [.updatedTimeDesc],
            page: 1,
            perPage: 25
        ) {
            if mediaType == .anime {
                animeList = result.data
            } else if mediaType == .manga {
                mangaList = result.data
            }
        }
    }
    
    func updateEntryProgress(of entry: CommonMediaListEntry) async {
        if let newEntry = await MediaListRepository.incrementOneProgress(of: entry.fragments.basicMediaListEntry) {
            guard let mediaType = entry.media?.type?.value else { return }
            await onEntryUpdated(newEntry, mediaType: mediaType)
        }
    }
    
    func onEntryUpdated(_ entry: BasicMediaListEntry, mediaType: MediaType) async {
        let list = mediaType == .anime ? animeList : mangaList
        guard let foundIndex = list.firstIndex(where: { $0.id == entry.id }) else { return }
        if list[safe: foundIndex]?.status != entry.status {
            if mediaType == .anime {
                animeList.removeAll(where: { $0.id == entry.id })
            } else {
                mangaList.removeAll(where: { $0.id == entry.id })
            }
        } else {
            if let updatedItem: CommonMediaListEntry = await MediaListRepository.updateCachedEntry(entry) {
                if mediaType == .anime {
                    animeList[foundIndex] = updatedItem
                } else {
                    mangaList[foundIndex] = updatedItem
                }
            }
        }
    }
}
