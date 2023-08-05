//
//  MediaRepository.swift
//  AniHyou
//
//  Created by Noah Kovacs on 8/4/23.
//

import Foundation
import AniListAPI

class MediaRepository {
    
    func updateList(mediaId: Int, status: MediaListStatus) {
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
            case .success(_):
                print("success")
            case .failure(let err):
                print(err)
            }
        }
    }
    
}
