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
            "Adaptation"
        case .prequel:
            "Prequel"
        case .sequel:
            "Sequel"
        case .parent:
            "Parent"
        case .sideStory:
            "Side Story"
        case .character:
            "Character"
        case .summary:
            "Summary"
        case .alternative:
            "Alternative"
        case .spinOff:
            "Spin Off"
        case .other:
            "Other"
        case .source:
            "Source"
        case .compilation:
            "Compilation"
        case .contains:
            "Contains"
        }
    }
}
