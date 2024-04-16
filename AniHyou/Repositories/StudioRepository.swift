//
//  StudioRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

struct StudioRepository {
    
    static func searchStudios(
        search: String,
        page: Int,
        perPage: Int = 25
    ) async -> PagedResult<SearchStudioQuery.Data.Page.Studio>? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.fetch(
                query: SearchStudioQuery(
                    page: .some(1),
                    perPage: .some(perPage),
                    search: .some(search)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let studios = pageData.studios?.compactMap({ $0 })
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
    
    static func getStudioDetails(
        studioId: Int,
        perPage: Int = 25
    ) async -> StudioDetailsQuery.Data.Studio? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.fetch(
                query: StudioDetailsQuery(
                    studioId: .some(studioId),
                    page: .some(1),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.studio)
                case.failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getStudioMedia(
        studioId: Int,
        page: Int,
        perPage: Int = 25
    ) async -> PagedResult<StudioMedia>? {
        await withCheckedContinuation { continuation in
            Network.shared.apollo.fetch(
                query: StudioMediaQuery(
                    studioId: .some(studioId),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.studio?.media,
                       let media = pageData.nodes?.compactMap({ $0?.fragments.studioMedia })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: media,
                                page: page + 1,
                                hasNextPage: pageData.pageInfo?.hasNextPage == true
                            )
                        )
                    }
                case.failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
}
