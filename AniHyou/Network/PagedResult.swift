//
//  PagedResult.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/03/2024.
//

import Foundation

struct PagedResult<Data> {
    let data: [Data]
    let page: Int
    let hasNextPage: Bool
}
