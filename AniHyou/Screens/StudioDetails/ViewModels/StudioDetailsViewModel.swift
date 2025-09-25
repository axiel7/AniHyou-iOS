//
//  StudioDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 03/01/2023.
//

import Foundation
import AniListAPI

@Observable class StudioDetailsViewModel {

    var studio: StudioDetailsQuery.Data.Studio?
    var studioMedia = [StudioMedia]()
    var currentPage = 1
    var hasNextPage = false

    func getStudioDetails(studioId: Int) async {
        if let result = await StudioRepository.getStudioDetails(studioId: studioId) {
            studio = result
            if let mediaItems = result.media?.nodes?.compactMap({ $0?.fragments.studioMedia }) {
                studioMedia.append(contentsOf: mediaItems)
                currentPage += 1
                hasNextPage = result.media?.pageInfo?.hasNextPage == true
            }
        }
    }

    func toggleFavorite() async {
        guard let studio else { return }
        if await FavoritesRepository.toggleFavorite(studioId: studio.id) != nil {
            onFavoriteToggled()
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
    
    func getStudioMedia(studioId: Int) async {
        if let result = await StudioRepository.getStudioMedia(studioId: studioId, page: currentPage) {
            studioMedia.append(contentsOf: result.data)
            currentPage = result.page
            hasNextPage = result.hasNextPage
        }
    }
}
