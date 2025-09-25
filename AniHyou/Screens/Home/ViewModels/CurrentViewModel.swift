//
//  CurrentViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/07/2024.
//

import Foundation
import AniListAPI

@Observable class CurrentViewModel {
    
    var isLoading = true
    var airingList: [CommonMediaListEntry] = []
    var behindList: [CommonMediaListEntry] = []
    var animeList: [CommonMediaListEntry] = []
    var mangaList: [CommonMediaListEntry] = []
    var hasNothing: Bool {
        airingList.isEmpty && behindList.isEmpty && animeList.isEmpty && mangaList.isEmpty
    }
    
    func fetchLists(refresh: Bool = false) async {
        isLoading = true
        
        if let anime = await getMediaList(.anime, refresh: refresh) {
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
        
        mangaList = await getMediaList(.manga, refresh: refresh) ?? []
        
        isLoading = false
    }
    
    private func getMediaList(_ mediaType: MediaType, refresh: Bool) async -> [CommonMediaListEntry]? {
        return await MediaListRepository.getUserMediaList(
            userId: LoginRepository.authUserId(),
            mediaType: mediaType,
            statusIn: [.current, .repeating],
            sort: [.updatedTimeDesc],
            page: nil,
            perPage: nil,
            forceReload: refresh
        )?.data
    }
    
    func updateEntryProgress(of entry: CommonMediaListEntry, type: CurrentView.ListType) async {
        if let newEntry = await MediaListRepository.incrementOneProgress(
            of: entry.fragments.basicMediaListEntry,
            totalProgress: entry.media?.maxProgress(isVolume: false),
            totalVolumes: entry.media?.maxProgress(isVolume: true)
        ) {
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
