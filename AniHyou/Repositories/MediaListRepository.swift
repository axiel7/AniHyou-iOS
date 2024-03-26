//
//  MediaRepository.swift
//  AniHyou
//
//  Created by Noah Kovacs on 8/4/23.
//

import Foundation
import AniListAPI
import WidgetKit

class MediaListRepository {
    
    static func updateListStatus(mediaId: Int, status: MediaListStatus) {
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
            notes: nil,
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
    
    static func onStatusUpdated(mediaId: Int, entryId: Int, status: MediaListStatus) {
        // Update the local cache
        Network.shared.apollo.store.withinReadWriteTransaction { transaction in
            do {
                try transaction.updateObject(
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
    
    static func updateEntry(
        mediaId: Int,
        status: MediaListStatus? = nil,
        score: Double? = nil,
        advancedScores: [Double]? = nil,
        progress: Int? = nil,
        progressVolumes: Int? = nil,
        startedAt: GraphQLNullable<FuzzyDateInput> = .none,
        completedAt: GraphQLNullable<FuzzyDateInput> = .none,
        repeatCount: Int? = nil,
        isPrivate: Bool? = nil,
        notes: String? = nil
    ) async -> BasicMediaListEntry? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.perform(mutation: UpdateEntryMutation(
                mediaId: .some(mediaId),
                status: someIfNotNil(status),
                score: someIfNotNil(score),
                progress: someIfNotNil(progress),
                progressVolumes: someIfNotNil(progressVolumes),
                startedAt: startedAt,
                completedAt: completedAt,
                repeat: someIfNotNil(repeatCount),
                private: someIfNotNil(isPrivate),
                notes: someIfNotNil(notes),
                advancedScores: someIfNotNil(advancedScores)
            )) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data?.saveMediaListEntry {
                        if let errors = graphQLResult.errors {
                            for error in errors {
                                print(error)
                            }
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
    
    static func updateProgress(
        entryId: Int,
        progress: Int,
        status: MediaListStatus? = nil
    ) async -> Bool {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.perform(mutation: UpdateEntryProgressMutation(
                saveMediaListEntryId: .some(entryId),
                progress: .some(progress),
                status: someIfNotNil(status)
            )) { result in
                switch result {
                case .success:
                    continuation.resume(returning: true)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: false)
                }
            }
        }
    }
    
    static func updateCachedEntry(
        mediaId: Int,
        entryId: Int,
        updatedEntry: BasicMediaListEntry? = nil,
        progress: Int? = nil
    ) async -> UserMediaListQuery.Data.Page.MediaList? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.store.withinReadWriteTransaction { transaction in
                do {
                    if let updatedEntry {
                        try transaction.updateObject(
                            ofType: BasicMediaListEntry.self,
                            withKey: "MediaList:\(entryId).\(mediaId)"
                        ) { (cachedData: inout BasicMediaListEntry) in
                            cachedData = updatedEntry
                        }
                    } else if let progress {
                        try transaction.updateObject(
                            ofType: ProgressMediaListEntry.self,
                            withKey: "MediaList:\(entryId).\(mediaId)"
                        ) { (cachedData: inout ProgressMediaListEntry) in
                            cachedData.progress = progress
                        }
                    }

                    let newObject = try transaction.readObject(
                        ofType: UserMediaListQuery.Data.Page.MediaList.self,
                        withKey: "MediaList:\(entryId).\(mediaId)"
                    )
                    if #available(iOS 17.0, *), progress != nil {
                        WidgetCenter.shared.reloadTimelines(ofKind: ANIME_BEHIND_WIDGET_KIND)
                        WidgetCenter.shared.reloadTimelines(ofKind: MEDIA_LIST_WIDGET_KIND)
                    }
                    continuation.resume(returning: newObject)
                } catch {
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
