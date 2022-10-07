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
    
    var search: String = ""
    @Published var type: SearchType = .anime
    
    func runSearch() {
        switch type {
        case .anime:
            print("")
            searchMedia(type: .anime)
        case .manga:
            print("")
            searchMedia(type: .manga)
        case .characters:
            print("characters")
        case .staff:
            print("staff")
        case .studios:
            print("studios")
        case .users:
            print("users")
        }
    }
    
    @Published var searchedMedia = [SearchMediaQuery.Data.Page.Medium?]()
    
    private func searchMedia(type: MediaType) {
        Network.shared.apollo.fetch(query: SearchMediaQuery(page: .some(1), perPage: .some(25), search: .some(search), type: .some(.case(type)))) { [weak self] result in
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
}
