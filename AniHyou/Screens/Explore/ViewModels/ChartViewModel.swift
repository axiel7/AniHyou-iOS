//
//  ChartViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import Foundation
import AniListAPI

class ChartViewModel: ObservableObject {

    private let perPage = 25

    @Published var mediaChart = [MediaChartQuery.Data.Page.Medium]()

    var currentPage = 1
    var hasNextPage = true

    func getMediaChart(type: MediaType, sort: MediaSort, status: MediaStatus?, format: MediaFormat? = nil) {
        Network.shared.apollo.fetch(
            query: MediaChartQuery(
                page: .some(currentPage),
                perPage: .some(perPage),
                sort: .some([.case(sort)]),
                type: .some(.case(type)),
                status: someIfNotNil(status),
                format: someIfNotNil(format)
            )
        ) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let page = graphQLResult.data?.page {
                    if let media = page.media?.compactMap({ $0 }) {
                        self?.mediaChart.append(contentsOf: media)
                        self?.currentPage += 1

                        // limit top 100 results
                        if (self?.currentPage) ?? 1 > 100 / (self?.perPage ?? 25) {
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
