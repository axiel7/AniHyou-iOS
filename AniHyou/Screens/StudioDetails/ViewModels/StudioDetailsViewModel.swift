//
//  StudioDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 03/01/2023.
//

import Foundation
import AniListAPI

class StudioDetailsViewModel: ObservableObject {

    @Published var studio: StudioDetailsQuery.Data.Studio?
    @Published var studioMedia = [StudioDetailsQuery.Data.Studio.Media.Node?]()
    var currentPage = 1
    var hasNextPage = true

    func getStudioDetails(studioId: Int) {
        Network.shared.apollo.fetch(query: StudioDetailsQuery(
            studioId: .some(studioId),
            page: .some(currentPage),
            perPage: .some(25)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let studio = graphQLResult.data?.studio {
                    self?.studio = studio
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

    func toggleFavorite() {
        guard let studio else { return }
        Network.shared.apollo.perform(mutation: ToggleFavouriteMutation(
            animeId: .none,
            mangaId: .none,
            characterId: .none,
            staffId: .none,
            studioId: .some(studio.id)
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if graphQLResult.data != nil {
                    self?.onFavoriteToggled()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func onFavoriteToggled() {
        guard let studioId = studio?.id else { return }
        Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                try transaction.updateObject(
                    ofType: IsFavouriteStudio.self,
                    withKey: "Studio:\(studioId)"
                ) { (cachedData: inout IsFavouriteStudio) in
                    cachedData.isFavourite = !cachedData.isFavourite
                }
                let newObject = try transaction.readObject(
                    ofType: StudioDetailsQuery.Data.Studio.self,
                    withKey: "Studio:\(studioId)"
                )
                DispatchQueue.main.async {
                    self?.studio = newObject
                }
            } catch {
                print(error)
            }
        })
    }
}
