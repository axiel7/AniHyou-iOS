//
//  MediaStatus.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import AniListAPI

extension MediaStatus {

    var localizedName: String {
        switch self {
        case .finished:
            return "Finished"
        case .releasing:
            return "Releasing"
        case .notYetReleased:
            return "Unreleased"
        case .cancelled:
            return "Cancelled"
        case .hiatus:
            return "Hiatus"
        }
    }
}