//
//  MediaStatusView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import API

struct MediaListStatusView: View {
    
    var mediaType: MediaType
    @State private var selection: MediaListStatus? = .current
    
    var body: some View {
        NavigationView {
            List(MediaListStatusAllCases, id: \.self) { status in
                NavigationLink(tag: status, selection: $selection) {
                    MediaListView(type: mediaType, status: status)
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
