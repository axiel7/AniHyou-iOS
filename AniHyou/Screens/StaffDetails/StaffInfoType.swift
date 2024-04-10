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
            "Overview"
        case .media:
            "Media"
        case .characters:
            "Characters"
        }
    }

    var systemImage: String {
        switch self {
        case .overview:
            "info.circle"
        case .media:
            "play.square"
        case .characters:
            "face.smiling"
        }
    }
}
