//
//  MediaDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import Foundation
import SwiftUI
import AniListAPI

class MediaDetailsViewModel: ObservableObject {

    @Published var mediaDetails: MediaDetailsQuery.Data.Media?

    func getMediaDetails(mediaId: Int) {
        Network.shared.apollo.fetch(query: MediaDetailsQuery(mediaId: .some(mediaId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.media {
                    self?.mediaDetails = media
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func toggleFavorite() {
        guard let mediaDetails else { return }
        var animeId: GraphQLNullable<Int> {
            if mediaDetails.type == .anime {
                return .some(mediaDetails.id)
            } else {
                return .none
            }
        }
        var mangaId: GraphQLNullable<Int> {
            if mediaDetails.type == .manga {
                return .some(mediaDetails.id)
            } else {
                return .none
            }
        }
        Network.shared.apollo.perform(mutation: ToggleFavouriteMutation(
            animeId: animeId,
            mangaId: mangaId,
            characterId: .none,
            staffId: .none,
            studioId: .none
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
        guard let mediaId = mediaDetails?.id else { return }
        Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                try transaction.updateObject(
                    ofType: IsFavouriteMedia.self,
                    withKey: "Media:\(mediaId)"
                ) { (cachedData: inout IsFavouriteMedia) in
                    cachedData.isFavourite = !cachedData.isFavourite
                }
                let newObject = try transaction.readObject(
                    ofType: MediaDetailsQuery.Data.Media.self,
                    withKey: "Media:\(mediaId)"
                )
                DispatchQueue.main.async {
                    self?.mediaDetails = newObject
                }
            } catch {
                print(error)
            }
        })
    }

    func onEntryUpdated(updatedEntry: BasicMediaListEntry?) {
        //Update the local cache
        Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                if let updatedEntry {
                    try transaction.updateObject(
                        ofType: BasicMediaListEntry.self,
                        withKey: "MediaList:\(updatedEntry.id).\(updatedEntry.mediaId)"
                    ) { (cachedData: inout BasicMediaListEntry) in
                        cachedData = updatedEntry
                    }
                }

                let newObject = try transaction.readObject(
                    ofType: MediaDetailsQuery.Data.Media.self,
                    withKey: "Media:\(updatedEntry?.mediaId ?? (self?.mediaDetails?.id ?? 0))"
                )
                DispatchQueue.main.async {
                    self?.mediaDetails = newObject
                }
            } catch {
                print(error)
            }
        })
    }

    func onEntryDeleted() {
        onEntryUpdated(updatedEntry: nil)
    }

    // MARK: calculated variables

    var isAnime: Bool {
        return mediaDetails?.type?.value == .anime
    }

    var genresFormatted: String? {
        guard let genres = mediaDetails?.genres else { return nil }
        return genres.compactMap { $0 }.joined(separator: ", ")
    }

    var studios: [MediaDetailsQuery.Data.Media.Studios.Node]? {
        mediaDetails?.studios?.nodes?.compactMap { $0 }.filter { $0.isAnimationStudio }
    }
    /// Returns a string with the studios comma separated
    var studiosFormatted: String? {
        guard let studios else { return nil }
        let strStudios = studios
            .compactMap { $0.name }
            .joined(separator: ", ")
        if strStudios.isEmpty {
            return nil
        } else { return strStudios }
    }

    var producers: [MediaDetailsQuery.Data.Media.Studios.Node]? {
        mediaDetails?.studios?.nodes?.compactMap { $0 }.filter { !$0.isAnimationStudio }
    }
    /// Returns a string with the producers comma separated
    var producersFormatted: String? {
        guard let producers else { return nil }
        let strProducers = producers
            .compactMap { $0.name }
            .joined(separator: ", ")
        if strProducers.isEmpty {
            return nil
        } else { return strProducers }
    }

    /// Returns a string with the synonyms \n separated
    var synonymsFormatted: String? {
        guard let synonyms = mediaDetails?.synonyms else { return nil }
        return synonyms.compactMap { $0 }.joined(separator: "\n")
    }

    var streamingLinks: [MediaDetailsQuery.Data.Media.ExternalLink?] {
        guard let externalLinks = mediaDetails?.externalLinks else { return [] }
        return externalLinks.filter { $0?.type?.value == .streaming }
    }

    var externalLinks: [MediaDetailsQuery.Data.Media.ExternalLink?] {
        guard let externalLinks = mediaDetails?.externalLinks else { return [] }
        return externalLinks.filter { $0?.type?.value != .streaming }
    }

    var trailerLink: String? {
        guard let site = mediaDetails?.trailer?.site else { return nil }
        switch site {
        case "youtube":
            return YOUTUBE_VIDEO_URL + (mediaDetails?.trailer?.id ?? "")
        case "dailymotion":
            return DAILYMOTION_VIDEO_URL + (mediaDetails?.trailer?.id ?? "")
        default:
            return nil
        }
    }

    var mediaShareLink: String? {
        guard let mediaType = mediaDetails?.type?.value else { return nil }
        return "\(mediaType.mediaUrl)\(mediaDetails!.id)"
    }
}
