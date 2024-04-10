//
//  MediaSeason.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension MediaSeason {
    
    var localizedStringKey: String {
        switch self {
        case .winter:
            "Winter"
        case .spring:
            "Spring"
        case .summer:
            "Summer"
        case .fall:
            "Fall"
        }
    }

    var localizedName: LocalizedStringKey {
        LocalizedStringKey(stringLiteral: localizedStringKey)
    }
}
