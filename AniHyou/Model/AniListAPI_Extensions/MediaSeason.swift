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
    
    var systemImage: String {
        switch self {
        case .winter:
            "snowflake"
        case .spring:
            "leaf.fill"
        case .summer:
            "sun.max.fill"
        case .fall:
            "cloud.rain.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .winter:
            Color.blue
        case .spring:
            Color.green
        case .summer:
            Color.yellow
        case .fall:
            Color.brown
        }
    }
}
