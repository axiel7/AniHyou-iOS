//
//  CurrentViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/07/2024.
//

import Foundation
import AniListAPI

@MainActor
@Observable class CurrentViewModel {
    
    var isLoading = true
    var airingList: [CommonMediaListEntry] = []
    var behindList: [CommonMediaListEntry] = []
    var animeList: [CommonMediaListEntry] = []
    var mangaList: [CommonMediaListEntry] = []
    var nextSeasonList: [CommonMediaListEntry] = []
    var hasNothing: Bool {
        airingList.isEmpty && behindList.isEmpty && animeList.isEmpty && mangaList.isEmpty && nextSeasonList.isEmpty
    }
    
    private let nowSeason = Date.now.getCurrentAnimeSeason()
    private let nextSeason = Date.now.getNextAnimeSeason()
    
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
        
        nextSeasonList = await getSeasonList(refresh: refresh)
        
        isLoading = false
    }
    
    private func getMediaList(_ mediaType: MediaType, refresh: Bool) async -> [CommonMediaListEntry]? {
        return await MediaListRepository.getUserMediaList(
            userId: Int32(LoginRepository.authUserId()),
            mediaType: mediaType,
            statusIn: [.current, .repeating],
            sort: [.updatedTimeDesc],
            page: nil,
            perPage: nil,
            forceReload: refresh
        )?.data
    }
    
    private func getSeasonList(refresh: Bool) async -> [CommonMediaListEntry] {
        let nowSeasonList = await MediaListRepository.getMySeasonalAnimeList(
            season: nowSeason,
            sort: [.popularityDesc],
            page: 1,
            forceReload: refresh
        )?.data ?? []
        
        let nextSeasonList = await MediaListRepository.getMySeasonalAnimeList(
            season: nextSeason,
            sort: [.popularityDesc],
            page: 1,
            forceReload: refresh
        )?.data ?? []
        
        return nowSeasonList + nextSeasonList
    }
    
    func updateEntryProgress(of entry: CommonMediaListEntry, type: CurrentListType) async {
        if let newEntry = await MediaListRepository.incrementOneProgress(
            of: entry.fragments.basicMediaListEntry,
            totalProgress: entry.media?.maxProgress(isVolume: false),
            totalVolumes: entry.media?.maxProgress(isVolume: true)
        ) {
            if type == .nextSeason {
                await fetchLists(refresh: true)
            } else {
                await onEntryUpdated(newEntry, type: type)
            }
        }
    }
    
    func onEntryUpdated(_ entry: BasicMediaListEntry, type: CurrentListType) async {
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
    
    private func getList(of type: CurrentListType) -> [CommonMediaListEntry] {
        switch type {
        case .airing:
            airingList
        case .behind:
            behindList
        case .anime:
            animeList
        case .manga:
            mangaList
        case .nextSeason:
            nextSeasonList
        }
    }
    
    private func setList(of type: CurrentListType, _ value: [CommonMediaListEntry]) {
        switch type {
        case .airing:
            airingList = value
        case .behind:
            behindList = value
        case .anime:
            animeList = value
        case .manga:
            mangaList = value
        case .nextSeason:
            nextSeasonList = value
        }
    }
}
