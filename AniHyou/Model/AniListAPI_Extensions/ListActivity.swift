//
//  ListActivity.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import Foundation
import AniListAPI
import SwiftUI

extension ListActivityFragment {
    
    // these ugly switches are required because otherwise Xcode won't localize the status strings
    static let watchedStatus = "watched episode"
    static let plansToWatchStatus = "plans to watch"
    static let readStatus = "read"
    static let plansToReadStatus = "plans to read"
    static let completedStatus = "completed"
    static let droppedStatus = "dropped"
    static let pausedStatus = "paused"
    
    var text: LocalizedStringKey {
        let mediaTitle = media?.title?.userPreferred ?? ""
        if let progress {
            switch status {
            case ListActivityFragment.watchedStatus:
                return "Watched episode \(progress) of \(mediaTitle)"
            case ListActivityFragment.readStatus:
                return "Read chapter \(progress) of \(mediaTitle)"
            default:
                return "\(status?.firstCapitalized ?? "") of \(mediaTitle)"
            }
        } else {
            switch status {
            case ListActivityFragment.plansToWatchStatus:
                return "Plans to watch \(mediaTitle)"
            case ListActivityFragment.plansToReadStatus:
                return "Plans to read \(mediaTitle)"
            case ListActivityFragment.completedStatus:
                return "Completed \(mediaTitle)"
            case ListActivityFragment.droppedStatus:
                return "Dropped \(mediaTitle)"
            case ListActivityFragment.pausedStatus:
                return "Paused \(mediaTitle)"
            default:
                return "\(status?.firstCapitalized ?? "") \(mediaTitle)"
            }
        }
    }
}
