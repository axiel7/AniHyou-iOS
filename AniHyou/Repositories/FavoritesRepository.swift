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
        do {
            let result = try await Network.shared.apollo.perform(
                mutation: ToggleFavouriteMutation(
                    animeId: someIfNotNil(animeId),
                    mangaId: someIfNotNil(mangaId),
                    characterId: someIfNotNil(characterId),
                    staffId: someIfNotNil(staffId),
                    studioId: someIfNotNil(studioId)
                )
            )
            return result.data != nil
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getAnime(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserFavoritesAnimeQuery.Data.User.Favourites.Anime.Node>? {
        await Network.fetchPagedResult(
            UserFavoritesAnimeQuery(
                userId: .some(userId),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.user?.favourites?.anime?.nodes?.compactMap { $0 } },
            extractPage: { $0.user?.favourites?.anime?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getManga(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserFavoritesMangaQuery.Data.User.Favourites.Manga.Node>? {
        await Network.fetchPagedResult(
            UserFavoritesMangaQuery(
                userId: .some(userId),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.user?.favourites?.manga?.nodes?.compactMap { $0 } },
            extractPage: { $0.user?.favourites?.manga?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getCharacters(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserFavoritesCharacterQuery.Data.User.Favourites.Characters.Node>? {
        await Network.fetchPagedResult(
            UserFavoritesCharacterQuery(
                userId: .some(userId),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.user?.favourites?.characters?.nodes?.compactMap { $0 } },
            extractPage: { $0.user?.favourites?.characters?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getStaff(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserFavoritesStaffQuery.Data.User.Favourites.Staff.Node>? {
        await Network.fetchPagedResult(
            UserFavoritesStaffQuery(
                userId: .some(userId),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.user?.favourites?.staff?.nodes?.compactMap { $0 } },
            extractPage: { $0.user?.favourites?.staff?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getStudios(
        userId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<UserFavoritesStudioQuery.Data.User.Favourites.Studios.Node>? {
        await Network.fetchPagedResult(
            UserFavoritesStudioQuery(
                userId: .some(userId),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.user?.favourites?.studios?.nodes?.compactMap { $0 } },
            extractPage: { $0.user?.favourites?.studios?.pageInfo?.fragments.commonPage }
        )
    }
}
