//
//  FavoritesRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

struct FavoritesRepository {
    
    static func toggleFavorite(
        animeId: Int32? = nil,
        mangaId: Int32? = nil,
        characterId: Int32? = nil,
        staffId: Int32? = nil,
        studioId: Int32? = nil
    ) async -> Bool? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.perform(
                mutation: ToggleFavouriteMutation(
                    animeId: someIfNotNil(animeId),
                    mangaId: someIfNotNil(mangaId),
                    characterId: someIfNotNil(characterId),
                    staffId: someIfNotNil(staffId),
                    studioId: someIfNotNil(studioId)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data != nil)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getAnime(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserFavoritesAnimeQuery.Data.User.Favourites.Anime.Node>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: UserFavoritesAnimeQuery(
                    userId: .some(userId),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.user?.favourites?.anime,
                       let animes = pageData.nodes?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: animes,
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
    
    static func getManga(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserFavoritesMangaQuery.Data.User.Favourites.Manga.Node>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: UserFavoritesMangaQuery(
                    userId: .some(userId),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.user?.favourites?.manga,
                       let mangas = pageData.nodes?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: mangas,
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
    
    static func getCharacters(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserFavoritesCharacterQuery.Data.User.Favourites.Characters.Node>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: UserFavoritesCharacterQuery(
                    userId: .some(userId),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.user?.favourites?.characters,
                       let characters = pageData.nodes?.compactMap({ $0 })
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
    
    static func getStaff(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserFavoritesStaffQuery.Data.User.Favourites.Staff.Node>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: UserFavoritesStaffQuery(
                    userId: .some(userId),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.user?.favourites?.staff,
                       let staff = pageData.nodes?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: staff,
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
    
    static func getStudios(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserFavoritesStudioQuery.Data.User.Favourites.Studios.Node>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: UserFavoritesStudioQuery(
                    userId: .some(userId),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.user?.favourites?.studios,
                       let studios = pageData.nodes?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: studios,
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
