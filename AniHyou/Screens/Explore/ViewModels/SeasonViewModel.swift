//
//  SeasonViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 05/04/2024.
//

import Foundation
import AniListAPI

class SeasonViewModel: ObservableObject {
    
    private let perPage = 25
    
    @Published var season: MediaSeason = Date.now.season
    @Published var year: Int = Date.now.year
    @Published var animeSeasonal = [SeasonalAnimeQuery.Data.Page.Medium]()

    var currentPage = 1
    var hasNextPage = false

    func getAnimeSeasonal(resetPage: Bool = false) {
        if resetPage { currentPage = 1 }
        Network.shared.apollo.fetch(
            query: SeasonalAnimeQuery(
                page: .some(currentPage),
                perPage: .some(perPage),
                season: .some(.case(season)),
                seasonYear: .some(year),
                sort: .some([.case(.popularityDesc)])
            )
        ) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let media = page.media?.compactMap({ $0 }) {
                        if resetPage {
                            self?.animeSeasonal = media
                        } else {
                            self?.animeSeasonal.append(contentsOf: media)
                        }
                    }
                    self?.currentPage += 1
                    self?.hasNextPage = page.pageInfo?.hasNextPage ?? false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
