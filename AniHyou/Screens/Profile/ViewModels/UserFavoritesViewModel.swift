//
//  UserFavoritesViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation
import AniListAPI

@MainActor
class UserFavoritesViewModel: ObservableObject {

    @Published var favoritesAnime = [UserFavoritesAnimeQuery.Data.User.Favourites.Anime.Node]()

    var currentPageAnime = 1
    var hasNextPageAnime = true

    func getFavoritesAnime(userId: Int) async {
        if let result = await FavoritesRepository.getAnime(userId: userId, page: currentPageAnime) {
            favoritesAnime.append(contentsOf: result.data)
            currentPageAnime = result.page
            hasNextPageAnime = result.hasNextPage
        }
    }

    @Published var favoritesManga = [UserFavoritesMangaQuery.Data.User.Favourites.Manga.Node]()

    var currentPageManga = 1
    var hasNextPageManga = true

    func getFavoritesManga(userId: Int) async {
        if let result = await FavoritesRepository.getManga(userId: userId, page: currentPageManga) {
            favoritesManga.append(contentsOf: result.data)
            currentPageManga = result.page
            hasNextPageManga = result.hasNextPage
        }
    }

    @Published var favoritesCharacters = [UserFavoritesCharacterQuery.Data.User.Favourites.Characters.Node]()

    var currentPageCharacter = 1
    var hasNextPageCharacter = true

    func getFavoritesCharacter(userId: Int) async {
        if let result = await FavoritesRepository.getCharacters(userId: userId, page: currentPageCharacter) {
            favoritesCharacters.append(contentsOf: result.data)
            currentPageCharacter = result.page
            hasNextPageCharacter = result.hasNextPage
        }
    }

    @Published var favoritesStaff = [UserFavoritesStaffQuery.Data.User.Favourites.Staff.Node]()

    var currentPageStaff = 1
    var hasNextPageStaff = true

    func getFavoritesStaff(userId: Int) async {
        if let result = await FavoritesRepository.getStaff(userId: userId, page: currentPageStaff) {
            favoritesStaff.append(contentsOf: result.data)
            currentPageStaff = result.page
            hasNextPageStaff = result.hasNextPage
        }
    }

    @Published var favoritesStudio = [UserFavoritesStudioQuery.Data.User.Favourites.Studios.Node]()

    var currentPageStudio = 1
    var hasNextPageStudio = true

    func getFavoritesStudio(userId: Int) async {
        if let result = await FavoritesRepository.getStudios(userId: userId, page: currentPageStudio) {
            favoritesStudio.append(contentsOf: result.data)
            currentPageStudio = result.page
            hasNextPageStudio = result.hasNextPage
        }
    }
}
