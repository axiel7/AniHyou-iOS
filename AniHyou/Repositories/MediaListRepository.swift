//
//  MediaRepository.swift
//  AniHyou
//
//  Created by Noah Kovacs on 8/4/23.
//

import Foundation
import AniListAPI

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
            notes: nil
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
                    try transaction.updateObject(
                        ofType: BasicMediaListEntry.self,
                        withKey: "MediaList:\(entryId).\(mediaId)"
                    ) { (cachedData: inout BasicMediaListEntry) in
                        if let updatedEntry { cachedData = updatedEntry }
                        if let progress { cachedData.progress = progress }
                    }

                    let newObject = try transaction.readObject(
                        ofType: UserMediaListQuery.Data.Page.MediaList.self,
                        withKey: "MediaList:\(entryId).\(mediaId)"
                    )
                    continuation.resume(returning: newObject)
                } catch {
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
