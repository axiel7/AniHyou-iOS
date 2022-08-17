//
//  MediaStatusView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI

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
