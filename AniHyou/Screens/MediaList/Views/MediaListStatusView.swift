//
//  MediaStatusView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import AniListAPI

struct MediaListStatusView: View {

    var mediaType: MediaType
    var userId: Int?
    @State private var selection: MediaListStatus? = .current

    var body: some View {
        NavigationView {
            List(MediaListStatus.allCases, id: \.self) { status in
                NavigationLink(tag: status, selection: $selection) {
                    MediaListView(type: mediaType, status: status, userId: userId)
                } label: {
                    Label(status.localizedName, systemImage: status.systemImage)
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
