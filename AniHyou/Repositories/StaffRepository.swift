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
        page: Int,
        perPage: Int = 25
    ) async -> PagedResult<SearchStaffQuery.Data.Page.Staff>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: SearchStaffQuery(
                    page: .some(page),
                    perPage: .some(perPage),
                    search: .some(search)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.page,
                       let staff = pageData.staff?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: staff,
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
    
    static func getStaffDetails(staffId: Int) async -> StaffDetailsQuery.Data.Staff? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(query: StaffDetailsQuery(staffId: .some(staffId))) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult.data?.staff)
                case .failure(let error):
                    print(error)
                    continuation.resume(returning: nil)
                }
            }
        }
    }
    
    static func getStaffMedia(
        staffId: Int,
        onMyList: Bool?,
        page: Int,
        perPage: Int = 25
    ) async -> PagedResult<StaffMediaGrouped>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: StaffMediaQuery(
                    staffId: .some(staffId),
                    onList: someIfNotNil(onMyList),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.staff?.staffMedia,
                       let edges = pageData.edges
                    {
                        var mediaGroupDict = [Int: StaffMediaGrouped]()
                        Dictionary(grouping: edges, by: { $0?.node?.id ?? 0 }).forEach { mediaId, value in
                            mediaGroupDict[mediaId] = StaffMediaGrouped(
                                value: value[0]!,
                                staffRoles: value.map { $0?.staffRole ?? "" }
                            )
                        }
                        let sortedDict = mediaGroupDict.values.sorted(by: { first, second in
                            first.value.node?.startDate?.fragments.fuzzyDateFragment.isoString() ?? "30001231" >
                            second.value.node?.startDate?.fragments.fuzzyDateFragment.isoString() ?? "30001231"
                        })
                        continuation.resume(
                            returning: PagedResult(
                                data: sortedDict,
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
    
    static func getStaffCharacters(
        staffId: Int,
        onMyList: Bool?,
        page: Int,
        perPage: Int = 25
    ) async -> PagedResult<StaffCharacterQuery.Data.Staff.CharacterMedia.Edge>? {
        await withUnsafeContinuation { continuation in
            Network.shared.apollo.fetch(
                query: StaffCharacterQuery(
                    staffId: .some(staffId),
                    onList: someIfNotNil(onMyList),
                    page: .some(page),
                    perPage: .some(perPage)
                )
            ) { result in
                switch result {
                case .success(let graphQLResult):
                    if let pageData = graphQLResult.data?.staff?.characterMedia,
                       let characters = pageData.edges?.compactMap({ $0 })
                    {
                        continuation.resume(
                            returning: PagedResult(
                                data: characters,
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
}
