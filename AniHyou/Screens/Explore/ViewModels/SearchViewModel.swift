//
//  SearchViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/6/22.
//

import Foundation
import API

class SearchViewModel: ObservableObject {
    
    //var currentPage = 1
    //var hasNextPage = true
    private let perPage = 25
    
    var search: String = ""
    @Published var type: SearchType = .anime
    @Published var sortMedia: MediaSort = .searchMatch
    @Published var selectedGenres = Set<String>()
    @Published var selectedTags = Set<String>()
    @Published var selectedGenresTagsJoined = ""
    
    func runSearch() {
        switch type {
        case .anime:
            searchMedia(type: .anime)
        case .manga:
            searchMedia(type: .manga)
        case .characters:
            searchCharacters()
        case .staff:
            searchStaff()
        case .studios:
            searchStudios()
        case .users:
            searchUsers()
        }
    }
    
    @Published var searchedMedia = [SearchMediaQuery.Data.Page.Medium?]()
    
    private func searchMedia(type: MediaType) {
        var searchWrap: GraphQLNullable<String> = .none
        if !search.isEmpty {
            searchWrap = .some(search)
        }
        
        var selectedGenresTags = [String]()
        
        var genreWrap: GraphQLNullable<[String?]> = .none
        if !selectedGenres.isEmpty {
            selectedGenresTags = Array(selectedGenres)
            genreWrap = .some(Array(selectedGenres))
        }
        var tagWrap: GraphQLNullable<[String?]> = .none
        if !selectedTags.isEmpty {
            if selectedGenresTags.isEmpty {
                selectedGenresTags = Array(selectedTags)
            } else {
                selectedGenresTags += Array(selectedTags)
            }
            tagWrap = .some(Array(selectedTags))
        }
        
        selectedGenresTagsJoined = selectedGenresTags.joined(separator: ", ")
        
        Network.shared.apollo.fetch(query: SearchMediaQuery(page: .some(1), perPage: .some(perPage), search: searchWrap, type: .some(.case(type)), sort: .some([.case(sortMedia)]), genre_in: genreWrap, tag_in: tagWrap)) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let media = page.media {
                        self?.searchedMedia = media
                        //self.currentPage += 1
                        //self.hasNextPage = page.pageInfo?.hasNextPage == true
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @Published var searchedCharacters = [SearchCharacterQuery.Data.Page.Character?]()
    
    private func searchCharacters() {
        Network.shared.apollo.fetch(query: SearchCharacterQuery(page: .some(1), perPage: .some(perPage), search: .some(search))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let characters = page.characters {
                        self?.searchedCharacters = characters
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @Published var searchedStaff = [SearchStaffQuery.Data.Page.Staff?]()
    
    private func searchStaff() {
        Network.shared.apollo.fetch(query: SearchStaffQuery(page: .some(1), perPage: .some(perPage), search: .some(search))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let staff = page.staff {
                        self?.searchedStaff = staff
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @Published var searchedStudios = [SearchStudioQuery.Data.Page.Studio?]()
    
    private func searchStudios() {
        Network.shared.apollo.fetch(query: SearchStudioQuery(page: .some(1), perPage: .some(perPage), search: .some(search))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let studios = page.studios {
                        self?.searchedStudios = studios
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @Published var searchedUsers = [SearchUserQuery.Data.Page.User?]()
    
    private func searchUsers() {
        Network.shared.apollo.fetch(query: SearchUserQuery(page: .some(1), perPage: .some(perPage), search: .some(search))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let users = page.users {
                        self?.searchedUsers = users
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @Published var genreCollection: [Genre]?
    @Published var tagCollection: [Genre]?
    
    func getGenreTagCollection() {
        Network.shared.apollo.fetch(query: GenreTagCollectionQuery()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    
                    //Workaround: SwiftUI List item selection only works on Identifiable objects

                    if let genres = data.genreCollection {
                        var tempGenres = [Genre]()
                        for genre in genres {
                            if genre != nil { tempGenres.append(Genre(id: genre!)) }
                        }
                        self?.genreCollection = tempGenres
                    }
                    
                    if let tags = data.mediaTagCollection {
                        var tempTags = [Genre]()
                        for tag in tags {
                            if tag != nil { tempTags.append(Genre(id: tag!.name)) }
                        }
                        self?.tagCollection = tempTags
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
