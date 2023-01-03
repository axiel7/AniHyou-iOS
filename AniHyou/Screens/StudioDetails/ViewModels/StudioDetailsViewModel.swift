//
//  StudioDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 03/01/2023.
//

import Foundation

class StudioDetailsViewModel: ObservableObject {
    
    @Published var studioName: String?
    @Published var studioFavorites: Int?
    @Published var studioMedia = [StudioDetailsQuery.Data.Studio.Media.Node?]()
    var currentPage = 1
    var hasNextPage = true
    
    func getStudioDetails(studioId: Int) {
        Network.shared.apollo.fetch(query: StudioDetailsQuery(studioId: .some(studioId), page: .some(currentPage), perPage: .some(25))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let studio = graphQLResult.data?.studio {
                    if self?.studioName == nil { self?.studioName = studio.name }
                    if self?.studioFavorites == nil { self?.studioFavorites = studio.favourites }
                    if let mediaItems = studio.media?.nodes {
                        self?.studioMedia.append(contentsOf: mediaItems)
                        self?.currentPage += 1
                        self?.hasNextPage = studio.media?.pageInfo?.hasNextPage ?? false
                    }
                }
            case.failure(let error):
                print(error)
            
            }
        }
    }
}
