//
//  MediaDetails.swift
//  AniHyou
//
//  Created by Axel Lopez on 06/01/2024.
//

import Foundation
import AniListAPI

extension BasicMediaDetails {
    func maxProgress(isVolume: Bool) -> Int? {
        switch type?.value {
        case .anime:
            episodes
        case .manga:
            if isVolume {
                volumes
            } else {
                chapters
            }
        default:
            nil
        }
    }
    
    var maxEpOrCh: Int? {
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

extension CommonMediaListEntry.Media {
    func maxProgress(isVolume: Bool) -> Int? {
        switch type?.value {
        case .anime:
            episodes
        case .manga:
            if isVolume {
                volumes
            } else {
                chapters
            }
        default:
            nil
        }
    }
}
