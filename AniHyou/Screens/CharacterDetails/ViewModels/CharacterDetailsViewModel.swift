//
//  CharacterDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/11/2022.
//

import Foundation

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
