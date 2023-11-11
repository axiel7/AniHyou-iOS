//
//  MediaStatus.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension MediaStatus {

    var localizedName: LocalizedStringKey {
        switch self {
        case .finished:
            return "Finished"
        case .releasing:
            return "Releasing"
        case .notYetReleased:
            return "Not yet released"
        case .cancelled:
            return "Cancelled"
        case .hiatus:
            return "Hiatus"
        }
    }
}
