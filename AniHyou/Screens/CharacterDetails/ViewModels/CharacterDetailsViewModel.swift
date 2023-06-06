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
