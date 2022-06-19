//
//  MediaListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI

struct MediaListView: View {
    
    var type: MediaType
    var status: MediaListStatus
    @StateObject private var viewModel = MediaListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.mediaList, id: \.?.media?.id) {
                if let item = $0 {
                    NavigationLink(destination: MediaDetailsView(mediaId: item.media!.id)) {
                        MediaListItemView(item: item)
                    }
                }
            }
            
            if viewModel.hasNextPage {
                ProgressView()
                    .onAppear {
                        viewModel.getUserMediaList(type: type, status: status)
                    }
            }
        }
        .navigationTitle(status.localizedName)
    }
}

struct MediaListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaListView(type: .anime, status: .current)
    }
}
