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
            "Finished"
        case .releasing:
            "Releasing"
        case .notYetReleased:
            "Not yet released"
        case .cancelled:
            "Cancelled"
        case .hiatus:
            "Hiatus"
        }
    }
}
