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
            ForEach(viewModel.mediaList, id: \.?.id) {
                if let item = $0 {
                    NavigationLink(destination: MediaDetailsView(mediaId: item.mediaId)) {
                        MediaListItemView(item: item, viewModel: viewModel)
                    }
                    .swipeActions {
                        if viewModel.mediaListStatus == .current {
                            Button("+1") {
                                viewModel.updateEntryProgress(entryId: item.id, progress: item.progress! + 1)
                            }
                            .tint(.green)
                        }
                    }
                }
            }//:ForEach
            
            if viewModel.hasNextPage {
                ProgressView()
                    .onAppear {
                        viewModel.getUserMediaList()
                    }
            }
        }//:List
        .navigationTitle(viewModel.mediaListStatus.localizedName)
        .refreshable {
            viewModel.refreshList()
        }
        .onAppear {
            viewModel.mediaType = type
            viewModel.mediaListStatus = status
        }
    }
}

struct MediaListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaListView(type: .anime, status: .current)
    }
}
