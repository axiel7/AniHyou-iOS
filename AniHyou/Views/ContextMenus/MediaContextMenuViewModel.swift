//
//  MediaContextMenuViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 12/07/2023.
//

import Foundation
import AniListAPI

class MediaContextMenuViewModel: ObservableObject {

    @Published var details: PreviewMediaDetailsQuery.Data.Media?

    func getDetails(mediaId: Int) {
        Network.shared.apollo.fetch(query: PreviewMediaDetailsQuery(mediaId: .some(mediaId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.media {
                    self?.details = media
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
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
        )) { [weak self] result in
            switch result {
            case .success(_):
                print("success")
            case .failure(let err):
                print(err)
            }
        }
    }
}
