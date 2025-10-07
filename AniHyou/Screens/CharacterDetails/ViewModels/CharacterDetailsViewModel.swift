//
//  CharacterDetailsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/11/2022.
//

import Foundation
import AniListAPI

@MainActor
@Observable class CharacterDetailsViewModel {

    var character: CharacterDetailsQuery.Data.Character?

    func getCharacterDetails(characterId: Int) async {
        character = await CharacterRepository.getCharacterDetails(characterId: Int32(characterId))
    }

    func toggleFavorite() async {
        guard let character else { return }
        if await FavoritesRepository.toggleFavorite(characterId: Int32(character.id)) != nil {
            await onFavoriteToggled()
        }
    }

    func onFavoriteToggled() async {
        guard let characterId = character?.id else { return }
        try? await Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                try await transaction.updateObject(
                    ofType: IsFavouriteCharacter.self,
                    withKey: "Character:\(characterId)"
                ) { (cachedData: inout IsFavouriteCharacter) in
                    cachedData.isFavourite = !cachedData.isFavourite
                }
                let newObject = try await transaction.readObject(
                    ofType: CharacterDetailsQuery.Data.Character.self,
                    withKey: "Character:\(characterId)"
                )
                DispatchQueue.main.async {
                    self?.character = newObject
                }
            } catch {
                print(error)
            }
        })
    }

    var characterMedia = [CharacterMediaQuery.Data.Character.Media.Edge]()
    var pageMedia: Int32 = 1
    var hasNextPageMedia = true

    func getCharacterMedia(characterId: Int) async {
        if let result = await CharacterRepository.getCharacterMedia(
            characterId: Int32(characterId),
            page: pageMedia
        ) {
            characterMedia.append(contentsOf: result.data)
            pageMedia = result.page
            hasNextPageMedia = result.hasNextPage
        }
    }

    // MARK: - calculated variables

    var alternativeNamesFormatted: String? {
        guard let alternative = character?.name?.alternative else { return nil }
        return alternative.compactMap { $0 }.joined(separator: ", ")
    }

    var alternativeNamesSpoilerFormatted: String? {
        guard let alternativeSpoiler = character?.name?.alternativeSpoiler else { return nil }
        return alternativeSpoiler.compactMap { $0 }.joined(separator: ", ")
    }
}
