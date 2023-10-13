//
//  MediaRelation.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension MediaRelation {

    var localizedName: LocalizedStringKey {
        switch self {
        case .adaptation:
            return "Adaptation"
        case .prequel:
            return "Prequel"
        case .sequel:
            return "Sequel"
        case .parent:
            return "Parent"
        case .sideStory:
            return "Side Story"
        case .character:
            return "Character"
        case .summary:
            return "Summary"
        case .alternative:
            return "Alternative"
        case .spinOff:
            return "Spin Off"
        case .other:
            return "Other"
        case .source:
            return "Source"
        case .compilation:
            return "Compilation"
        case .contains:
            return "Contains"
        }
    }
}
