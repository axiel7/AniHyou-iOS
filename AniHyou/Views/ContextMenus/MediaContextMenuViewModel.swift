//
//  MediaContextMenuViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 12/07/2023.
//

import Foundation
import AniListAPI

@MainActor
@Observable class MediaContextMenuViewModel {

    var details: PreviewMediaDetailsQuery.Data.Media?

    func getDetails(mediaId: Int) {
        Network.shared.apollo.fetch(
            query: PreviewMediaDetailsQuery(mediaId: .some(Int32(mediaId)))
        ) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.media {
                    Task { @MainActor in
                        self?.details = media
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
