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
        Network.shared.apollo.fetch(query: SearchMediaQuery(page: .some(1), perPage: .some(perPage), search: .some(search), type: .some(.case(type)))) { [weak self] result in
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
}
