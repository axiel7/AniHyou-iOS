//
//  UserFavoritesViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import Foundation

class UserFavoritesViewModel: ObservableObject {
    
    //MARK: anime
    @Published var favoritesAnime = [UserFavoritesAnimeQuery.Data.User.Favourite.Anime.Node?]()
    
    var currentPageAnime = 1
    var hasNextPageAnime = true
    
    func getFavoritesAnime(userId: Int) {
        Network.shared.apollo.fetch(query: UserFavoritesAnimeQuery(userId: userId, page: currentPageAnime, perPage: 20)) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.user?.favourites?.anime {
                    if let animes = page.nodes {
                        self?.favoritesAnime.append(contentsOf: animes)
                    }
                    self?.currentPageAnime += 1
                    self?.hasNextPageAnime = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: manga
    @Published var favoritesManga = [UserFavoritesMangaQuery.Data.User.Favourite.Manga.Node?]()
    
    var currentPageManga = 1
    var hasNextPageManga = true
    
    func getFavoritesManga(userId: Int) {
        Network.shared.apollo.fetch(query: UserFavoritesMangaQuery(userId: userId, page: currentPageManga, perPage: 20)) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.user?.favourites?.manga {
                    if let mangas = page.nodes {
                        self?.favoritesManga.append(contentsOf: mangas)
                    }
                    self?.currentPageManga += 1
                    self?.hasNextPageManga = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: characters
    @Published var favoritesCharacters = [UserFavoritesCharacterQuery.Data.User.Favourite.Character.Node?]()
    
    var currentPageCharacter = 1
    var hasNextPageCharacter = true
    
    func getFavoritesCharacter(userId: Int) {
        Network.shared.apollo.fetch(query: UserFavoritesCharacterQuery(userId: userId, page: currentPageCharacter, perPage: 20)) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.user?.favourites?.characters {
                    if let characters = page.nodes {
                        self?.favoritesCharacters.append(contentsOf: characters)
                    }
                    self?.currentPageCharacter += 1
                    self?.hasNextPageCharacter = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: staff
    @Published var favoritesStaff = [UserFavoritesStaffQuery.Data.User.Favourite.Staff.Node?]()
    
    var currentPageStaff = 1
    var hasNextPageStaff = true
    
    func getFavoritesStaff(userId: Int) {
        Network.shared.apollo.fetch(query: UserFavoritesStaffQuery(userId: userId, page: currentPageStaff, perPage: 20)) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.user?.favourites?.staff {
                    if let staff = page.nodes {
                        self?.favoritesStaff.append(contentsOf: staff)
                    }
                    self?.currentPageStaff += 1
                    self?.hasNextPageStaff = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: studios
    @Published var favoritesStudio = [UserFavoritesStudioQuery.Data.User.Favourite.Studio.Node?]()
    
    var currentPageStudio = 1
    var hasNextPageStudio = true
    
    func getFavoritesStudio(userId: Int) {
        Network.shared.apollo.fetch(query: UserFavoritesStudioQuery(userId: userId, page: currentPageStudio, perPage: 20)) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.user?.favourites?.studios {
                    if let studios = page.nodes {
                        self?.favoritesStudio.append(contentsOf: studios)
                    }
                    self?.currentPageStudio += 1
                    self?.hasNextPageStudio = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
