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
    
    @Published var isLoading = false
    @Published var airingList: [CommonMediaListEntry] = []
    @Published var animeList: [CommonMediaListEntry] = []
    @Published var mangaList: [CommonMediaListEntry] = []
    
    func fetchLists() async {
        isLoading = true
        await getMediaList(mediaType: .anime)
        await getMediaList(mediaType: .manga)
        isLoading = false
    }
    
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
                airingList = result.data
                    .filter { $0.media?.status?.value == .releasing }
                    .sorted(by: {
                        $0.media?.nextAiringEpisode?.airingAt ?? 0 < $1.media?.nextAiringEpisode?.airingAt ?? 0
                    })
                animeList = result.data.filter { $0.media?.status?.value != .releasing }
            } else if mediaType == .manga {
                mangaList = result.data
            }
        }
    }
    
    func updateEntryProgress(of entry: CommonMediaListEntry, type: CurrentView.ListType) async {
        if let newEntry = await MediaListRepository.incrementOneProgress(of: entry.fragments.basicMediaListEntry) {
            guard let mediaType = entry.media?.type?.value else { return }
            await onEntryUpdated(newEntry, type: type)
        }
    }
    
    func onEntryUpdated(_ entry: BasicMediaListEntry, type: CurrentView.ListType) async {
        let list = switch type {
        case .airing:
            airingList
        case .anime:
            animeList
        case .manga:
            mangaList
        }
        guard let foundIndex = list.firstIndex(where: { $0.id == entry.id }) else { return }
        if list[safe: foundIndex]?.status != entry.status {
            switch type {
            case .airing:
                airingList.removeAll(where: { $0.id == entry.id })
            case .anime:
                animeList.removeAll(where: { $0.id == entry.id })
            case .manga:
                mangaList.removeAll(where: { $0.id == entry.id })
            }
        } else {
            if let updatedItem: CommonMediaListEntry = await MediaListRepository.updateCachedEntry(entry) {
                switch type {
                case .airing:
                    airingList[foundIndex] = updatedItem
                case .anime:
                    animeList[foundIndex] = updatedItem
                case .manga:
                    mangaList[foundIndex] = updatedItem
                }
            }
        }
    }
}
