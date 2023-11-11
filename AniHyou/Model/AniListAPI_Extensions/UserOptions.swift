//
//  UserOptions.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import Foundation
import SwiftUI
import AniListAPI

extension String {
    var profileHexColor: String {
        if self.hasPrefix("#") { return self }

        switch self {
        case "blue":
            return "#3DB4F2"
        case "purple":
            return "#C063FF"
        case "pink":
            return "#FC9DD6"
        case "orange":
            return "#EF881B"
        case "red":
            return "#E13433"
        case "green":
            return "#4DCA51"
        case "gray":
            return "#677B94"
        default:
            return ANIHYOU_COLOR
        }
    }
}

extension UserTitleLanguage {
    var localizedName: LocalizedStringKey {
        switch self {
        case .romaji:
            return "Romaji"
        case .english:
            return "English"
        case .native:
            return "Native"
        case .romajiStylised:
            return "Romaji"
        case .englishStylised:
            return "English"
        case .nativeStylised:
            return "Native"
        }
    }
    
    static public var allCasesNormal: [UserTitleLanguage] = [.romaji, .english, .native]
}

extension UserStaffNameLanguage {
    var localizedName: LocalizedStringKey {
        switch self {
        case .romajiWestern:
            return "Romaji (Western Order)"
        case .romaji:
            return "Romaji"
        case .native:
            return "Native"
        }
    }
}
