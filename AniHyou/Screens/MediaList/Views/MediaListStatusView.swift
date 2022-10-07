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
    @State private var selection: [MediaListStatus] = [.current]
    
    var body: some View {
        NavigationStack(path: $selection) {
            List(MediaListStatusAllCases, id: \.self) { status in
                NavigationLink(value: status) {
                    Label(status.localizedName, systemImage: status.systemIcon)
                }
            }//:List
            .navigationTitle(mediaType == .anime ? "Anime List" : "Manga List")
            .navigationDestination(for: MediaListStatus.self) { status in
                MediaListView(type: mediaType, status: status)
            }
        }//:NavigationView
    }
}

struct MediaListStatusView_Previews: PreviewProvider {
    static var previews: some View {
        MediaListStatusView(mediaType: .anime)
    }
}
