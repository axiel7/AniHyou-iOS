//
//  MediaDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import Foundation

class MediaDetailsViewModel: ObservableObject {
    
    @Published var mediaDetails: MediaDetailsQuery.Data.Medium?
    
    func getMediaDetails(id: Int) {
        Network.shared.apollo.fetch(query: MediaDetailsQuery(mediaId: id)) { result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.media {
                    self.mediaDetails = media
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
