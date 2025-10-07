//
//  StaffRepository.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/04/2024.
//

import Foundation
import AniListAPI

struct StaffRepository {
    
    static func searchStaff(
        search: String,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<SearchStaffQuery.Data.Page.Staff>? {
        await Network.fetchPagedResult(
            SearchStaffQuery(
                page: .some(page),
                perPage: .some(perPage),
                search: .some(search)
            ),
            extractItems: { $0.page?.staff?.compactMap { $0 } },
            extractPage: { $0.page?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getStaffDetails(staffId: Int32) async -> StaffDetailsQuery.Data.Staff? {
        do {
            let result = try await Network.shared.apollo.fetch(
                query: StaffDetailsQuery(staffId: .some(staffId))
            )
            return result.data?.staff
        } catch {
            print(error)
            return nil
        }
    }
    
    static func getStaffMedia(
        staffId: Int32,
        onMyList: Bool?,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<StaffMediaGrouped>? {
        await Network.fetchPagedResult(
            StaffMediaQuery(
                staffId: .some(staffId),
                onList: someIfNotNil(onMyList),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { result in
                guard let edges = result.staff?.staffMedia?.edges else { return nil }
                var mediaGroupDict = [Int: StaffMediaGrouped]()
                Dictionary(grouping: edges, by: { $0?.node?.id ?? 0 }).forEach { mediaId, value in
                    mediaGroupDict[mediaId] = StaffMediaGrouped(
                        value: value[0]!,
                        staffRoles: value.map { $0?.staffRole ?? "" }
                    )
                }
                return mediaGroupDict.values.sorted { first, second in
                    (first.value.node?.startDate?.fragments.fuzzyDateFragment.isoString() ?? "30001231") >
                    (second.value.node?.startDate?.fragments.fuzzyDateFragment.isoString() ?? "30001231")
                }
            },
            extractPage: { $0.staff?.staffMedia?.pageInfo?.fragments.commonPage }
        )
    }
    
    static func getStaffCharacters(
        staffId: Int32,
        onMyList: Bool?,
        page: Int32,
        perPage: Int32 = 25
    ) async -> PagedResult<StaffCharacterQuery.Data.Staff.CharacterMedia.Edge>? {
        await Network.fetchPagedResult(
            StaffCharacterQuery(
                staffId: .some(staffId),
                onList: someIfNotNil(onMyList),
                page: .some(page),
                perPage: .some(perPage)
            ),
            extractItems: { $0.staff?.characterMedia?.edges?.compactMap { $0 } },
            extractPage: { $0.staff?.characterMedia?.pageInfo?.fragments.commonPage }
        )
    }
}
