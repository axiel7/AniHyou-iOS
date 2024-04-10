//
//  CountryOfOrigin.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/10/2023.
//

import Foundation
import SwiftUI
import AniListAPI

extension CountryOfOrigin {
    var localizedName: LocalizedStringKey {
        switch self {
        case .japan:
            "Japan"
        case .southKorea:
            "South Korea"
        case .china:
            "China"
        case .taiwan:
            "Taiwan"
        }
    }
    
    var color: Color {
        switch self {
        case .japan:
            Color.accentColor
        case .southKorea:
            Color("Score60")
        case .china:
            Color("Score40")
        case .taiwan:
            Color("Score50")
        }
    }
}
