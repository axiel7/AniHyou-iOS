//
//  StringUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation

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
        default:
            return "Spring"
        }
    }
}
