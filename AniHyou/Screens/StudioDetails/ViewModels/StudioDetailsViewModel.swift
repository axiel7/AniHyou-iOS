//
//  StudioDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 03/01/2023.
//

import Foundation
import AniListAPI

@MainActor
@Observable class StudioDetailsViewModel {

    var studio: StudioDetailsQuery.Data.Studio?
    var studioMedia = [StudioMedia]()
    var currentPage: Int32 = 1
    var hasNextPage = false
    var sort = MediaSort.startDateDesc
    var onMyList: Bool?

    func getStudioDetails(studioId: Int) async {
        if let result = await StudioRepository.getStudioDetails(studioId: Int32(studioId)) {
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
        if await FavoritesRepository.toggleFavorite(studioId: Int32(studio.id)) != nil {
            await onFavoriteToggled()
        }
    }

    func onFavoriteToggled() async {
        guard let studioId = studio?.id else { return }
        try? await Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                try await transaction.updateObject(
                    ofType: IsFavouriteStudio.self,
                    withKey: "Studio:\(studioId)"
                ) { (cachedData: inout IsFavouriteStudio) in
                    cachedData.isFavourite = !cachedData.isFavourite
                }
                let newObject = try await transaction.readObject(
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
        if let result = await StudioRepository.getStudioMedia(
            studioId: Int32(studioId),
            sort: [sort],
            onList: onMyList,
            page: currentPage
        ) {
            if currentPage == 1 {
                studioMedia.removeAll()
            }
            studioMedia.append(contentsOf: result.data)
            currentPage = result.page
            hasNextPage = result.hasNextPage
        }
    }
    
    func refresh() async {
        guard let studioId = studio?.id else { return }
        currentPage = 1
        hasNextPage = false
        await getStudioMedia(studioId: studioId)
    }
}
