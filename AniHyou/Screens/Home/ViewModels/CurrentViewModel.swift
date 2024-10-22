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
    
    @Published var isLoading = true
    @Published var airingList: [CommonMediaListEntry] = []
    @Published var behindList: [CommonMediaListEntry] = []
    @Published var animeList: [CommonMediaListEntry] = []
    @Published var mangaList: [CommonMediaListEntry] = []
    var hasNothing: Bool {
        airingList.isEmpty && behindList.isEmpty && animeList.isEmpty && mangaList.isEmpty
    }
    
    func fetchLists() async {
        isLoading = true
        
        if let anime = await getMediaList(mediaType: .anime) {
            airingList = anime
                .filter { $0.media?.status?.value == .releasing && !$0.isBehind }
                .sorted(by: {
                    $0.media?.nextAiringEpisode?.airingAt ?? 0 < $1.media?.nextAiringEpisode?.airingAt ?? 0
                })
            behindList = anime
                .filter { $0.media?.status?.value == .releasing && $0.isBehind }
                .sorted(by: { $0.episodesBehind < $1.episodesBehind })
            animeList = anime.filter { $0.media?.status?.value != .releasing }
        }
        
        mangaList = await getMediaList(mediaType: .manga) ?? []
        
        isLoading = false
    }
    
    private func getMediaList(mediaType: MediaType) async -> [CommonMediaListEntry]? {
        return await MediaListRepository.getUserMediaList(
            userId: LoginRepository.authUserId(),
            mediaType: mediaType,
            status: .current,
            sort: [.updatedTimeDesc],
            page: nil,
            perPage: nil
        )?.data
    }
    
    func updateEntryProgress(of entry: CommonMediaListEntry, type: CurrentView.ListType) async {
        if let newEntry = await MediaListRepository.incrementOneProgress(of: entry.fragments.basicMediaListEntry) {
            await onEntryUpdated(newEntry, type: type)
        }
    }
    
    func onEntryUpdated(_ entry: BasicMediaListEntry, type: CurrentView.ListType) async {
        var list = getList(of: type)
        guard let foundIndex = list.firstIndex(where: { $0.id == entry.id }) else { return }
        if list[safe: foundIndex]?.status != entry.status {
            list.removeAll(where: { $0.id == entry.id })
        } else {
            if let updatedItem: CommonMediaListEntry = await MediaListRepository.updateCachedEntry(entry) {
                list[foundIndex] = updatedItem
            }
            if type == .behind
                && !entry.isBehind(nextAiringEpisode: list[foundIndex].media?.nextAiringEpisode?.episode)
            {
                airingList.append(list.remove(at: foundIndex))
            }
        }
        setList(of: type, list)
    }
    
    private func getList(of type: CurrentView.ListType) -> [CommonMediaListEntry] {
        switch type {
        case .airing:
            airingList
        case .behind:
            behindList
        case .anime:
            animeList
        case .manga:
            mangaList
        }
    }
    
    private func setList(of type: CurrentView.ListType, _ value: [CommonMediaListEntry]) {
        switch type {
        case .airing:
            airingList = value
        case .behind:
            behindList = value
        case .anime:
            animeList = value
        case .manga:
            mangaList = value
        }
    }
}
