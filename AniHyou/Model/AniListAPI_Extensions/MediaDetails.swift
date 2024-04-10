//
//  MediaDetails.swift
//  AniHyou
//
//  Created by Axel Lopez on 06/01/2024.
//

import Foundation
import AniListAPI

extension BasicMediaDetails {
    var maxProgress: Int? {
        switch type?.value {
        case .anime:
            episodes
        case .manga:
            chapters
        default:
            nil
        }
    }
}
