//
//  StringUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation

extension String {
    
    var htmlStripped: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}

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

extension MediaFormat {
    
    var localizedName: String {
        switch self {
        case .tv:
            return "TV"
        case .tvShort:
            return "TV Short"
        case .movie:
            return "Movie"
        case .special:
            return "Special"
        case .ova:
            return "OVA"
        case .ona:
            return "ONA"
        case .music:
            return "Music"
        case .manga:
            return "Manga"
        case .novel:
            return "Novel"
        case .oneShot:
            return "OneShot"
        case .__unknown(let rawValue):
            return rawValue
        }
    }
}

extension MediaStatus {
    
    var localizedName: String {
        switch self {
        case .finished:
            return "Finished"
        case .releasing:
            return "Releasing"
        case .notYetReleased:
            return "Unreleased"
        case .cancelled:
            return "Cancelled"
        case .hiatus:
            return "Hiatus"
        case .__unknown(let rawValue):
            return rawValue
        }
    }
}
