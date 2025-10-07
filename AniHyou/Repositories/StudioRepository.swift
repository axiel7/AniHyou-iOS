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
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<SearchStudioQuery.Data.Page.Studio>? {
        await Network.fetchPagedResult(
            SearchStudioQuery(
                page: .some(page),
                perPage: .some(perPage),
                search: .some(search)
            ),
            extractItems: { $0.page?.studios?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getStudioDetails(
        studioId: Int32,
        perPage: Int32 = 25
    ) async -> StudioDetailsQuery.Data.Studio? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: StudioDetailsQuery(
                    studioId: .some(studioId),
                    page: .some(1),
                    perPage: .some(perPage)
                )
            )
            return result.data?.studio
        } catch {
            print(error)
            return nil
        }
    }

    static func getStudioMedia(
        studioId: Int32,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<StudioMedia>? {
        await Network.fetchPagedResult(
            StudioMediaQuery(
                studioId: .some(studioId),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.studio?.media?.nodes?.compactMap { $0?.fragments.studioMedia } },
            extractPage: { $0.studio?.media?.pageInfo?.fragments.commonPage }
        )
    }
}
