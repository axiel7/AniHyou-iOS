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
                        MediaListItemView(item: item)
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
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Menu {
                    Picker("Sort", selection: $viewModel.sort) {
                        Text("Title").tag(MediaListSort.mediaTitleNativeDesc)
                        Text("Score").tag(MediaListSort.scoreDesc)
                        Text("Last Updated").tag(MediaListSort.updatedTimeDesc)
                        Text("Last Added").tag(MediaListSort.addedTimeDesc)
                    }
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                }
            }
        }
        .navigationTitle(viewModel.mediaListStatus.localizedName)
        .refreshable {
            viewModel.refreshList()
        } 
        .onChange(of: viewModel.sort) { _ in
            viewModel.refreshList()
        }
        .onChange(of: viewModel.updatedEntry) { _ in
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
        NavigationView {
            MediaListView(type: .anime, status: .current)
        }
    }
}
