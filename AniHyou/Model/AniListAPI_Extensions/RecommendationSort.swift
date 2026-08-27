//
//  RecommendationSort.swift
//  AniHyou
//
//  Created by Axel on 26/08/2026.
//

import SwiftUI
import AniListAPI

extension RecommendationSort {
    var lozalizedName: LocalizedStringKey {
        switch self {
        case .id:
            "Recent"
        case .idDesc:
            "Recent"
        case .rating:
            "Score"
        case .ratingDesc:
            "Score"
        }
    }
}
