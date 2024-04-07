//
//  PagedResult.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/03/2024.
//

import Foundation

class PagedResult<Data> {
    let data: [Data]
    let page: Int
    let hasNextPage: Bool
    
    init(data: [Data], page: Int, hasNextPage: Bool) {
        self.data = data
        self.page = page
        self.hasNextPage = hasNextPage
    }
}
