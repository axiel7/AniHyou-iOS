//
//  CharacterRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

struct CharacterRepository {
    
    static func searchCharacters(
        search: String,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<SearchCharacterQuery.Data.Page.Character>? {
        await Network.fetchPagedResult(
            SearchCharacterQuery(
                page: .some(page),
                perPage: .some(perPage),
                search: .some(search)
            ),
            extractItems: { $0.page?.characters?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getCharacterDetails(characterId: Int32) async -> CharacterDetailsQuery.Data.Character? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: CharacterDetailsQuery(characterId: .some(characterId))
            )
            return result.data?.character
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getCharacterMedia(
        characterId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<CharacterMediaQuery.Data.Character.Media.Edge>? {
        await Network.fetchPagedResult(
            CharacterMediaQuery(
                characterId: .some(characterId),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.character?.media?.edges?.compactMap { $0 } },
            extractPage: { $0.character?.media?.pageInfo?.fragments.commonPage }
        )
    }
}
