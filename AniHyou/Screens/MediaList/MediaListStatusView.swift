//
//  MediaStatusView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI

extension MediaListStatus {
    var localizedName: String {
        switch self {
        case .current:
            return "Current"
        case .completed:
            return "Completed"
        case .paused:
            return "Paused"
        case .planning:
            return "Planning"
        case .dropped:
            return "Dropped"
        case .repeating:
            return "Repeating"
        default:
            return "Unknown"
        }
    }
    
    /// System symbol name representing this status
    var systemIcon: String {
        switch self {
        case .current:
            return "play.circle"
        case .completed:
            return "checkmark.circle"
        case .paused:
            return "pause.circle"
        case .planning:
            return "clock"
        case .dropped:
            return "trash"
        case .repeating:
            return "repeat"
        default:
            return "questionmark.circle"
        }
    }
}

struct MediaListStatusView: View {
    
    var mediaType: MediaType
    @State private var selection: Int? = MediaListStatus.current.hashValue
    
    var body: some View {
        NavigationView {
            List(MediaListStatus.allCases, id: \.hashValue) { status in
                NavigationLink(tag: status.hashValue, selection: $selection) {
                    MediaListView(type: mediaType, status: status)
                } label: {
                    Label(status.localizedName, systemImage: status.systemIcon)
                }
            }//:List
            .navigationTitle(mediaType == .anime ? "Anime List" : "Manga List")
        }//:NavigationView
    }
}

struct MediaListStatusView_Previews: PreviewProvider {
    static var previews: some View {
        MediaListStatusView(mediaType: .anime)
    }
}
