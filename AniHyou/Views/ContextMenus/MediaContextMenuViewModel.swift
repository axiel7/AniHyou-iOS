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

    func getDetails(mediaId: Int) async {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: PreviewMediaDetailsQuery(mediaId: .some(Int32(mediaId)))
            )
            if let media = result.data?.media {
                self.details = media
            }
        } catch {
            print(error)
        }
    }
}
