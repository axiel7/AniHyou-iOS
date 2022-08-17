//
//  ProfileInfoType.swift
//  AniHyou
//
//  Created by Axel Lopez on 13/08/2022.
//

import Foundation

public enum ProfileInfoType: Equatable, Hashable, CaseIterable {
    case activity
    case about
    case stats
    case favorites
    case social
}

extension ProfileInfoType {
    var localizedName: String {
        switch self {
        case .activity:
            return "Activity"
        case .about:
            return "About"
        case .stats:
            return "Stats"
        case .favorites:
            return "Favorites"
        case .social:
            return "Social"
        }
    }
    
    var systemImage: String {
        switch self {
        case .activity:
            return "waveform.path.ecg"
        case .about:
            return "info.circle"
        case .stats:
            return "percent"
        case .favorites:
            return "star"
        case .social:
            return "person.3"
        }
    }
}
