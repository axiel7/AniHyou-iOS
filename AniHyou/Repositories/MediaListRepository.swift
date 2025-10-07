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
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: UserListCollectionQuery(
                    userId: .some(userId),
                    type: .some(.case(mediaType)),
                    sort: .some(sort.map({ .case($0) })),
                    chunk: someIfNotNil(chunk),
                    perChunk: someIfNotNil(perChunk)
                ),
                cachePolicy: forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.mediaListCollection,
                       let lists = pageData.lists?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: lists,
                                page: (chunk ?? 0) + 1,
                                hasNextPage: pageData.hasNextChunk == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
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
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: UserMediaListQuery(
                    page: someIfNotNil(page),
                    perPage: someIfNotNil(perPage),
                    userId: .some(userId),
                    type: .some(.case(mediaType)),
                    statusIn: someEnumArrayIfNotEmpty(statusIn),
                    sort: .some(sort.map({ .case($0) }))
                ),
                cachePolicy: forceReload ? .fetchIgnoringCacheData : .returnCacheDataElseFetch
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let list = pageData.mediaList?.compactMap({ $0?.fragments.commonMediaListEntry })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: list,
                                page: page ?? 0 + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getShouUserMediaList(
        userId: Int32,
        mediaType: MediaType,
        statusIn: [MediaListStatus] = [],
        sort: [MediaListSort],
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<ShouUserMediaList>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: ShouUserMediaListQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    userId: .some(userId),
                    type: .some(.case(mediaType)),
                    statusIn: someEnumArrayIfNotEmpty(statusIn),
                    sort: .some(sort.map({ .case($0) }))
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let list = pageData.mediaList?.compactMap({ $0?.fragments.shouUserMediaList })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: list,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func updateListStatus(mediaId: Int32, status: MediaListStatus) {
        Network.shared.apollo.perform(mutation: UpdateEntryMutation(
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
        )) { result in
            switch result {
            case .success(let graphQLResult):
                if let entryId = graphQLResult.data?.saveMediaListEntry?.id {
                    onStatusUpdated(mediaId: mediaId, entryId: entryId, status: status)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func onStatusUpdated(mediaId: Int32, entryId: Int, status: MediaListStatus) {
        // Update the local cache
        Network.shared.apollo.store.withinReadWriteTransaction { transaction in
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
        await withUnsafeContinuation { continuation in
            
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
            
            Network.shared.apollo.perform(
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
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data?.saveMediaListEntry {
                        if let errors = graphQLResult.errors {
                            for error in errors {
                                print(error)
                            }
                            continuation.resume(returning: nil)
                        } else {
                            continuation.resume(returning: data.fragments.basicMediaListEntry)
                        }
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
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
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.perform(
                mutation: UpdateEntryProgressMutation(
                    saveMediaListEntryId: .some(entryId),
                    progress: someIfNotNil(progress),
                    progressVolumes: someIfNotNil(progressVolumes),
                    status: someIfNotNil(status)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    let newEntry = graphQLResult.data?.saveMediaListEntry?.fragments.basicMediaListEntry
                    continuation.resume(returning: newEntry)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    @discardableResult
    static func updateCachedEntry<T: RootSelectionSet>(_ entry: BasicMediaListEntry) async -> T? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.store.withinReadWriteTransaction { transaction in
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
                    continuation.resume(returning: newObject)
                } catch {
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func deleteEntry(entryId: Int32) async -> Bool? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.perform(
                mutation: DeleteMediaListMutation(
                    mediaListEntryId: .some(entryId)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.deleteMediaListEntry?.deleted)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getMediaListIds(
        userId: Int32,
        type: MediaType,
        status: MediaListStatus?,
        chunk: Int32,
        perChunk: Int32 = 500
    ) async -> PagedResult<Int>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: MediaListIdsQuery(
                    type: .some(.case(type)),
                    userId: .some(userId),
                    status: someIfNotNil(status),
                    chunk: .some(chunk),
                    perChunk: .some(perChunk)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageInfo = graphQLResult.data?.mediaListCollection,
                       let ids = pageInfo.lists?
                           .compactMap({ $0?.entries })
                           .flatMap({ $0.compactMap({ $0?.mediaId }) })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: ids,
                                page: chunk + 1,
                                hasNextPage: pageInfo.hasNextChunk == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
// swiftlint:disable:next file_length
}
