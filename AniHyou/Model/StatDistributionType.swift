//
//  StatDistributionType.swift
//  AniHyou
//
//  Created by Axel Lopez on 27/03/2024.
//

import Foundation
import SwiftUI
import AniListAPI

enum StatDistributionType: CaseIterable, Hashable {
    case titles
    case time
    case score
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .titles:
            return "Title count"
        case .time:
            return "Time spent"
        case .score:
            return "Mean score"
        }
    }
    
    func userStatisticsSort(ascencing: Bool) -> UserStatisticsSort {
        switch self {
        case .titles:
            return ascencing ? .count : .countDesc
        case .time:
            return ascencing ? .progress : .progressDesc
        case .score:
            return ascencing ? .meanScore : .meanScoreDesc
        }
    }
}
