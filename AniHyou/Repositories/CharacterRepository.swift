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
        page: Int,
        perPage: Int = 25
    ) async -> PagedResult<SearchCharacterQuery.Data.Page.Character>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: SearchCharacterQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    search: .some(search)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let characters = pageData.characters?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: characters,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getCharacterDetails(characterId: Int) async -> CharacterDetailsQuery.Data.Character? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: CharacterDetailsQuery(
                    characterId: .some(characterId)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.character)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getCharacterMedia(
        characterId: Int,
        page: Int,
        perPage: Int = 25
    ) async -> PagedResult<CharacterMediaQuery.Data.Character.Media.Edge>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: CharacterMediaQuery(
                    characterId: .some(characterId),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.character?.media,
                       let media = pageData.edges?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: media,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    } else {
                        continuation.resume(returning: nil)
                    }
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
