//
//  ExploreViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var mediaChart = [MediaChartQuery.Data.Page.Medium?]()
    
    var currentPage = 1
    var hasNextPage = true
    
    func getMediaChart(type: MediaType, sort: MediaSort) {
        Network.shared.apollo.fetch(query: MediaChartQuery(page: currentPage, perPage: 25, sort: [sort], type: type)) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let media = page.media {
                        self?.mediaChart.append(contentsOf: media)
                        self?.currentPage += 1
                        
                        // limit top 100 results
                        if (page.pageInfo?.currentPage ?? self?.currentPage) ?? 1 >= 100 * 25 {
                            self?.hasNextPage = false
                        } else {
                            self?.hasNextPage = page.pageInfo?.hasNextPage ?? false
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
