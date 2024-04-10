//
//  ProfileInfoType.swift
//  AniHyou
//
//  Created by Axel Lopez on 13/08/2022.
//

import Foundation
import SwiftUI

public enum ProfileInfoType: Equatable, Hashable, CaseIterable {
    case activity
    case stats
    case favorites
    case social
}

extension ProfileInfoType {
    var localizedName: LocalizedStringKey {
        switch self {
        case .activity:
            "Activity"
        case .stats:
            "Stats"
        case .favorites:
            "Favorites"
        case .social:
            "Social"
        }
    }

    var systemImage: String {
        switch self {
        case .activity:
            "waveform.path.ecg"
        case .stats:
            "percent"
        case .favorites:
            "star"
        case .social:
            "person.3"
        }
    }
}
