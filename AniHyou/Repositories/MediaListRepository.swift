//
//  MediaRepository.swift
//  AniHyou
//
//  Created by Noah Kovacs on 8/4/23.
//

import Foundation
import AniListAPI
import WidgetKit

// swiftlint:disable:next type_body_length
struct MediaListRepository {
    
    static func getMediaListCollection(
        userId: Int32,
        mediaType: MediaType,
        sort: [MediaListSort],
        chunk: Int32?,
        perChunk: Int32? = 50,
        forceReload: Bool = false
    ) async -> PagedResult<UserListCollectionQuery.Data.MediaListCollection.List>? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: UserListCollectionQuery(
                    userId: .some(userId),
                    type: .some(.case(mediaType)),
                    sort: .some(sort.map({ .case($0) })),
                    chunk: someIfNotNil(chunk),
                    perChunk: someIfNotNil(perChunk)
                ),
                cachePolicy: forceReload ? .networkOnly : .cacheFirst
            )
            if let pageData = result.data?.mediaListCollection,
               let lists = pageData.lists?.compactMap({ $0 })
            {
                return PagedResult(
                    data: lists,
                    page: (chunk ?? 0) + 1,
                    hasNextPage: pageData.hasNextChunk == true
                )
            }
            return nil
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getUserMediaList(
        userId: Int32,
        mediaType: MediaType,
        statusIn: [MediaListStatus]?,
        sort: [MediaListSort],
        page: Int32?,
        perPage: Int32? = 25,
        forceReload: Bool = false
    ) async -> PagedResult<CommonMediaListEntry>? {
        await Network.fetchPagedResult(
            UserMediaListQuery(
                page: someIfNotNil(page),
                perPage: someIfNotNil(perPage),
                userId: .some(userId),
                type: .some(.case(mediaType)),
                statusIn: someEnumArrayIfNotEmpty(statusIn),
                sort: .some(sort.map({ .case($0) }))
            ),
            forceReload: forceReload,
            extractItems: { $0.page?.mediaList?.compactMap { $0?.fragments.commonMediaListEntry } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getShouUserMediaList(
        userId: Int32,
        mediaType: MediaType,
        statusIn: [MediaListStatus] = [],
        sort: [MediaListSort],
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<ShouUserMediaList>? {
        await Network.fetchPagedResult(
            ShouUserMediaListQuery(
                page: .some(page),
                perPage: .some(perPage),
                userId: .some(userId),
                type: .some(.case(mediaType)),
                statusIn: someEnumArrayIfNotEmpty(statusIn),
                sort: .some(sort.map({ .case($0) }))
            ),
            extractItems: { $0.page?.mediaList?.compactMap { $0?.fragments.shouUserMediaList } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func updateListStatus(mediaId: Int32, status: MediaListStatus) async {
        do {
            let result = try await Network.shared.apollo.perform(
                mutation: UpdateEntryMutation(
                    mediaId: .some(mediaId),
                    status: someIfNotNil(status),
                    score: nil,
                    progress: nil,
                    progressVolumes: nil,
                    startedAt: nil,
                    completedAt: nil,
                    repeat: nil,
                    private: nil,
                    hiddenFromStatusLists: nil,
                    notes: nil,
                    customLists: nil,
                    advancedScores: nil
                )
            )
            if let entryId = result.data?.saveMediaListEntry?.id {
                await onStatusUpdated(mediaId: mediaId, entryId: entryId, status: status)
            }
        } catch {
            print(error)
        }
    }
    
    static func onStatusUpdated(mediaId: Int32, entryId: Int, status: MediaListStatus) async {
        // Update the local cache
        try? await Network.shared.apollo.store.withinReadWriteTransaction { transaction in
            do {
                try await transaction.updateObject(
                    ofType: BasicMediaListEntry.self,
                    withKey: "MediaList:\(entryId).\(mediaId)"
                ) { (cachedData: inout BasicMediaListEntry) in
                    cachedData.status = .case(status)
                }

                // TODO: refresh the source by sending the new object or using ApolloClient.watch ?
                /*let newObject = try transaction.readObject(
                    ofType: UserMediaListQuery.Data.Page.MediaList.self,
                    withKey: "MediaList:\(entryId).\(mediaId)"
                )*/
            } catch {
                print(error)
            }
        }
    }
    
    // swiftlint:disable:next cyclomatic_complexity function_body_length
    static func updateEntry(
        oldEntry: BasicMediaListEntry?,
        mediaId: Int32,
        status: MediaListStatus? = nil,
        score: Double? = nil,
        advancedScores: [String: Double]? = nil,
        progress: Int? = nil,
        progressVolumes: Int? = nil,
        startedAt: Date? = nil,
        completedAt: Date? = nil,
        repeatCount: Int? = nil,
        isPrivate: Bool? = nil,
        isHiddenFromStatusLists: Bool? = nil,
        customLists: [String: Bool]? = nil,
        notes: String? = nil
    ) async -> BasicMediaListEntry? {
        let setStatus: MediaListStatus? = if status != oldEntry?.status?.value {
            status
        } else {
            nil
        }
        
        let setScore: Double? = if score != oldEntry?.score { score } else { nil }
        
        let setProgress: Int32? = if progress != oldEntry?.progress { progress?.toInt32() } else { nil }
        
        let setProgressVolumes: Int32? = if progressVolumes != oldEntry?.progressVolumes {
            progressVolumes?.toInt32()
        } else {
            nil
        }
        
        let setStartedAt: FuzzyDateInput? =
        if oldEntry?.startedAt?.fragments.fuzzyDateFragment.isEqual(startedAt?.toFuzzyDate()) == false {
            startedAt?.toFuzzyDate()
        } else {
            nil
        }
        var startedAtQL = someIfNotNil(setStartedAt)
        if startedAt == nil { startedAtQL = .null } //remove date
        
        let setCompletedAt: FuzzyDateInput? =
        if oldEntry?.completedAt?.fragments.fuzzyDateFragment.isEqual(completedAt?.toFuzzyDate()) == false {
            completedAt?.toFuzzyDate()
        } else {
            nil
        }
        var completedAtQL = someIfNotNil(setCompletedAt)
        if completedAt == nil { completedAtQL = .null } //remove date
        
        let setRepeat: Int32? = if repeatCount != oldEntry?.repeat { repeatCount?.toInt32() } else { nil }
        
        let setIsPrivate: Bool? = if isPrivate != oldEntry?.private { isPrivate } else { nil }
        
        let setIsHiddenFromStatusLists: Bool? = if isHiddenFromStatusLists != oldEntry?.hiddenFromStatusLists {
            isHiddenFromStatusLists
        } else {
            nil
        }
        
        let setCustomLists: [String]? = customLists?.filter({ $0.value }).keys.sorted()
        
        let setNotes: String? = if notes != oldEntry?.notes { notes } else { nil }
        
        var setAdvancedScores: [Double]?
        // this is required because in Swift there's no equivalent to LinkedHashMap...
        // and AniList API expects a float array ordered
        if let advancedScores,
            let advancedScoresOrdered = UserDefaults.standard.stringArray(forKey: ADVANCED_SCORES_KEY) {
            setAdvancedScores = []
            for name in advancedScoresOrdered {
                if let score = advancedScores[name] {
                    setAdvancedScores?.append(score)
                }
            }
        }
        do {
            let result = try await Network.shared.apollo.perform(
                mutation: UpdateEntryMutation(
                    mediaId: .some(mediaId),
                    status: someIfNotNil(setStatus),
                    score: someIfNotNil(setScore),
                    progress: someIfNotNil(setProgress),
                    progressVolumes: someIfNotNil(setProgressVolumes),
                    startedAt: startedAtQL,
                    completedAt: completedAtQL,
                    repeat: someIfNotNil(setRepeat),
                    private: someIfNotNil(setIsPrivate),
                    hiddenFromStatusLists: someIfNotNil(setIsHiddenFromStatusLists),
                    notes: someIfNotNil(setNotes),
                    customLists: someIfNotNil(setCustomLists),
                    advancedScores: someIfNotNil(setAdvancedScores)
                )
            )
            if let data = result.data?.saveMediaListEntry {
                if let errors = result.errors {
                    for error in errors {
                        print(error)
                    }
                    return nil
                } else {
                    return data.fragments.basicMediaListEntry
                }
            }
            return nil
        } catch {
            print(error)
            return nil
        }
    }
    
    static func incrementOneProgress(
        of entry: BasicMediaListEntry,
        totalProgress: Int?,
        totalVolumes: Int?
    ) async -> BasicMediaListEntry? {
        let isPlanning = entry.status == .planning
        let isRepeating = entry.status == .repeating
        let status: MediaListStatus? = if isPlanning {
            .current
        } else {
            nil
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
        let startedAt: Date? = if (!isRepeating || entry.startedAt?.fragments.fuzzyDateFragment.isNil() ?? true)
                            && (isPlanning || !entry.progress.isGreaterThanZero)
        {
            Date.now
        } else {
            entry.startedAt?.fragments.fuzzyDateFragment.asDate()
        }
        let isMaxProgress = totalProgress != nil && progress != nil && progress! >= totalProgress!
        let completedAt: Date? = if (!isRepeating || entry.completedAt?.fragments.fuzzyDateFragment.isNil() ?? true)
                            && isMaxProgress
        {
            Date.now
        } else {
            entry.completedAt?.fragments.fuzzyDateFragment.asDate()
        }
        return await MediaListRepository.updateEntry(
            oldEntry: entry,
            mediaId: Int32(entry.mediaId),
            status: status,
            progress: progress,
            progressVolumes: progressVolumes,
            startedAt: startedAt,
            completedAt: completedAt
        )
    }
    
    static func updateProgress(
        entryId: Int32,
        progress: Int32?,
        progressVolumes: Int32? = nil,
        status: MediaListStatus? = nil
    ) async -> BasicMediaListEntry? {
        do {
            let result = try await Network.shared.apollo.perform(
                mutation: UpdateEntryProgressMutation(
                    saveMediaListEntryId: .some(entryId),
                    progress: someIfNotNil(progress),
                    progressVolumes: someIfNotNil(progressVolumes),
                    status: someIfNotNil(status)
                )
            )
            return result.data?.saveMediaListEntry?.fragments.basicMediaListEntry
        } catch {
            print(error)
            return nil
        }
    }
    
    @discardableResult
    static func updateCachedEntry<T: RootSelectionSet>(_ entry: BasicMediaListEntry) async -> T? {
        try? await Network.shared.apollo.store.withinReadWriteTransaction { transaction in
            do {
                try await transaction.updateObject(
                    ofType: BasicMediaListEntry.self,
                    withKey: "MediaList:\(entry.id).\(entry.mediaId)"
                ) { (cachedData: inout BasicMediaListEntry) in
                    cachedData = entry
                }

                let newObject = try await transaction.readObject(
                    ofType: T.self,
                    withKey: "MediaList:\(entry.id).\(entry.mediaId)"
                )
                WidgetCenter.shared.reloadTimelines(ofKind: ANIME_BEHIND_WIDGET_KIND)
                WidgetCenter.shared.reloadTimelines(ofKind: MEDIA_LIST_WIDGET_KIND)
                return newObject
            } catch {
                print(error)
                return nil
            }
        }
    }
    
    static func deleteEntry(entryId: Int32) async -> Bool? {
        do {
            let result = try await Network.shared.apollo.perform(
                mutation: DeleteMediaListMutation(
                    mediaListEntryId: .some(entryId)
                )
            )
            return result.data?.deleteMediaListEntry?.deleted
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getMediaListIds(
        userId: Int32,
        type: MediaType,
        status: MediaListStatus?,
        chunk: Int32,
        perChunk: Int32 = 500
    ) async -> PagedResult<Int>? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: MediaListIdsQuery(
                    type: .some(.case(type)),
                    userId: .some(userId),
                    status: someIfNotNil(status),
                    chunk: .some(chunk),
                    perChunk: .some(perChunk)
                )
            )
            if let pageInfo = result.data?.mediaListCollection,
               let ids = pageInfo.lists?
                   .compactMap({ $0?.entries })
                   .flatMap({ $0.compactMap({ $0?.mediaId }) })
            {
                return PagedResult(
                    data: ids,
                    page: chunk + 1,
                    hasNextPage: pageInfo.hasNextChunk == true
                )
            }
            return nil
        } catch {
            print(error)
            return nil
        }
    }
// swiftlint:disable:next file_length
}
