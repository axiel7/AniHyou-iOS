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
            "Title count"
        case .time:
            "Time spent"
        case .score:
            "Mean score"
        }
    }
    
    func userStatisticsSort(ascencing: Bool) -> UserStatisticsSort {
        switch self {
        case .titles:
            ascencing ? .count : .countDesc
        case .time:
            ascencing ? .progress : .progressDesc
        case .score:
            ascencing ? .meanScore : .meanScoreDesc
        }
    }
}
