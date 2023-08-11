//
//  MediaSeason.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import AniListAPI

extension MediaSeason {

    var localizedName: String {
        switch self {
        case .winter:
            return "Winter"
        case .spring:
            return "Spring"
        case .summer:
            return "Summer"
        case .fall:
            return "Fall"
        }
    }
}
