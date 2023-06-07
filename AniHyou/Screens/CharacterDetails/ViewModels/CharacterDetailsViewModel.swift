//
//  CharacterDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/11/2022.
//

import Foundation
import AniListAPI

class CharacterDetailsViewModel: ObservableObject {
    
    @Published var character: CharacterDetailsQuery.Data.Character?
    
    func getCharacterDetails(characterId: Int) {
        Network.shared.apollo.fetch(query: CharacterDetailsQuery(characterId: .some(characterId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let character = graphQLResult.data?.character {
                    self?.character = character
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func toggleFavorite() {
        guard character != nil else { return }
        Network.shared.apollo.perform(mutation: ToggleFavouriteMutation(animeId: .none, mangaId: .none, characterId: .some(character!.id), staffId: .none, studioId: .none)) { [weak self] result in
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
        guard let characterId = character?.id else { return }
        Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                try transaction.updateObject(ofType: IsFavouriteCharacter.self, withKey: "Character:\(characterId)") { (cachedData: inout IsFavouriteCharacter) in
                    cachedData.isFavourite = !cachedData.isFavourite
                }
                let newObject = try transaction.readObject(ofType: CharacterDetailsQuery.Data.Character.self, withKey: "Character:\(characterId)")
                DispatchQueue.main.async {
                    self?.character = newObject
                }
            } catch {
                print(error)
            }
        })
    }
    
    @Published var characterMedia = [CharacterMediaQuery.Data.Character.Media.Edge?]()
    var pageMedia = 1
    var hasNextPageMedia = true
    
    func getCharacterMedia(characterId: Int) {
        Network.shared.apollo.fetch(query: CharacterMediaQuery(characterId: .some(characterId), page: .some(pageMedia), perPage: .some(25))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.character?.media {
                    self?.characterMedia.append(contentsOf: media.edges ?? [])
                    self?.pageMedia = (media.pageInfo?.currentPage ?? self?.pageMedia ?? 1) + 1
                    self?.hasNextPageMedia = media.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: calculated variables
    
    var alternativeNamesFormatted: String? {
        guard character?.name?.alternative != nil else { return nil }
        return character!.name!.alternative!.compactMap { $0 }.joined(separator: ", ")
    }
    
    var alternativeNamesSpoilerFormatted: String? {
        guard character?.name?.alternativeSpoiler != nil else { return nil }
        return character!.name!.alternativeSpoiler!.compactMap { $0 }.joined(separator: ", ")
    }
}
