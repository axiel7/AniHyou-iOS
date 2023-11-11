//
//  CountryOfOrigin.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/10/2023.
//

import Foundation
import SwiftUI

enum CountryOfOrigin: String, CaseIterable, Hashable {
    case japan = "JP"
    case southKorea = "KR"
    case china = "CN"
    case taiwan = "TW"
    
    var localized: LocalizedStringKey {
        switch self {
        case .japan:
            return "Japan"
        case .southKorea:
            return "South Korea"
        case .china:
            return "China"
        case .taiwan:
            return "Taiwan"
        }
    }
}
