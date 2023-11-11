//
//  StaffInfoType.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/06/2023.
//

import Foundation
import SwiftUI

public enum StaffInfoType: Equatable, Hashable, CaseIterable {
    case overview
    case media
    case characters
}

extension StaffInfoType {
    var localizedName: LocalizedStringKey {
        switch self {
        case .overview:
            return "Overview"
        case .media:
            return "Media"
        case .characters:
            return "Characters"
        }
    }

    var systemImage: String {
        switch self {
        case .overview:
            return "info.circle"
        case .media:
            return "play.square"
        case .characters:
            return "face.smiling"
        }
    }
}
