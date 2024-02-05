//
//  MediaStatusView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import AniListAPI

struct MediaListStatusView: View {

    let mediaType: MediaType
    var userId: Int?
    @AppStorage(LIST_STATUS_KEY) private var selection: MediaListStatus?
    @State private var showingMediaDetails = false
    @State private var mediaId = 0

    var body: some View {
        NavigationSplitView {
            List(MediaListStatus.allCases, id: \.self, selection: $selection) { status in
                Label(status.localizedName, systemImage: status.systemImage)
            }//:List
            .navigationTitle(mediaType == .anime ? "Anime List" : "Manga List")
        } detail: {
            if let selection {
                NavigationStack {
                    MediaListView(type: mediaType, status: selection, userId: userId)
                        .id(selection)
                        .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
                }
            }
        }//:NavigationSplitView
    }
}

#Preview {
    MediaListStatusView(mediaType: .anime)
}
