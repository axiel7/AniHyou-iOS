//
//  MediaDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import Foundation
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
    
    func onEntryUpdated(updatedEntry: BasicMediaListEntry?) {
        //Update the local cache
        Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                if updatedEntry != nil {
                    try transaction.updateObject(ofType: BasicMediaListEntry.self, withKey: "MediaList:\(updatedEntry!.id).\(updatedEntry!.mediaId)") { (cachedData: inout BasicMediaListEntry) in
                        cachedData = updatedEntry!
                    }
                }
                
                let newObject = try transaction.readObject(ofType: MediaDetailsQuery.Data.Media.self, withKey: "Media:\(updatedEntry?.mediaId ?? (self?.mediaDetails?.id ?? 0))")
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
    
    //MARK: calculated variables
    
    var isAnime: Bool {
        return mediaDetails?.type?.value == .anime
    }
    
    var genresFormatted: String? {
        guard mediaDetails != nil else { return nil }
        guard mediaDetails?.genres != nil else { return nil }
        return mediaDetails!.genres!.compactMap { $0 }.joined(separator: ", ")
    }
    
    /// Returns a string with the season and year if has it
    var seasonFormatted: String? {
        guard mediaDetails != nil else { return nil }
        guard mediaDetails?.season?.value != nil else { return nil }
        if mediaDetails?.seasonYear != nil {
            return "\(mediaDetails!.season!.value!.localizedName) \(mediaDetails!.seasonYear!)"
        } else {
            return mediaDetails?.season?.value?.localizedName
        }
    }
    
    /// Returns a string with the studios comma separated
    var studiosFormatted: String? {
        guard mediaDetails != nil else { return nil }
        guard mediaDetails?.studios?.nodes != nil else { return nil }
        var strStudios = ""
        for studio in mediaDetails!.studios!.nodes! {
            if studio?.isAnimationStudio == true {
                if let name = studio?.name {
                    strStudios += "\(name), "
                }
            }
        }
        if strStudios.isEmpty { return nil }
        else { return String(strStudios.dropLast(2)) }
    }
    
    /// Returns a string with the producers comma separated
    var producersFormatted: String? {
        guard mediaDetails != nil else { return nil }
        guard mediaDetails?.studios?.nodes != nil else { return nil }
        var strProducers = ""
        for producer in mediaDetails!.studios!.nodes! {
            if producer?.isAnimationStudio == false {
                if let name = producer?.name {
                    strProducers += "\(name), "
                }
            }
        }
        if strProducers.isEmpty { return nil }
        else { return String(strProducers.dropLast(2)) }
    }
    
    /// Returns a string with the synonyms \n separated
    var synonymsFormatted: String? {
        guard mediaDetails != nil else { return nil }
        guard mediaDetails?.synonyms != nil else { return nil }
        return mediaDetails!.synonyms!.compactMap { $0 }.joined(separator: "\n")
    }
    
    var streamingLinks: [MediaDetailsQuery.Data.Media.ExternalLink?] {
        guard mediaDetails != nil else { return [] }
        guard mediaDetails?.externalLinks != nil else { return [] }
        return mediaDetails!.externalLinks!.filter { $0?.type?.value == .streaming }
    }
    
    var externalLinks: [MediaDetailsQuery.Data.Media.ExternalLink?] {
        guard mediaDetails != nil else { return [] }
        guard mediaDetails?.externalLinks != nil else { return [] }
        return mediaDetails!.externalLinks!.filter { $0?.type?.value != .streaming }
    }
    
    var trailerLink: String? {
        guard mediaDetails != nil else { return nil }
        guard mediaDetails?.trailer != nil else { return nil }
        switch mediaDetails?.trailer?.site {
        case "youtube":
            return YOUTUBE_VIDEO_URL + (mediaDetails?.trailer?.id ?? "")
        case "dailymotion":
            return DAILYMOTION_VIDEO_URL + (mediaDetails?.trailer?.id ?? "")
        default:
            return nil
        }
    }
    
    var mediaShareLink: String? {
        guard mediaDetails != nil else { return nil }
        switch mediaDetails!.type?.value {
        case .anime:
            return "\(ANILIST_ANIME_URL)\(mediaDetails!.id)"
        case .manga:
            return "\(ANILIST_MANGA_URL)\(mediaDetails!.id)"
        default:
            return nil
        }
    }
}
