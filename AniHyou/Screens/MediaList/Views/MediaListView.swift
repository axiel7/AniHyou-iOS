//
//  MediaListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import API

struct MediaListView: View {
    
    let type: MediaType
    var status: MediaListStatus
    @StateObject private var viewModel = MediaListViewModel()
    @State private var showingEditSheet = false
    @AppStorage(LIST_STYLE_KEY) private var listStyle = 0
    
    var body: some View {
        List {
            ForEach(viewModel.filteredMediaList, id: \.?.id) {
                if let item = $0 {
                    NavigationLink(destination: MediaDetailsView(mediaId: item.mediaId)) {
                        switch listStyle {
                        case 1:
                            MediaListItemMinimalView(item: item)
                        case 2:
                            MediaListItemCompactView(item: item)
                        default:
                            MediaListItemStandardView(item: item)
                        }
                    }
                    .swipeActions {
                        if viewModel.mediaListStatus == .current || viewModel.mediaListStatus == .repeating {
                            Button(action: {
                                viewModel.updateEntryProgress(entryId: item.id, progress: item.progress! + 1)
                            }) {
                                if type == .anime {
                                    Label("Ep", systemImage: "plus")
                                // should show a sheet to add a rating
                                } else if type == .manga {
                                    Label("Ch", systemImage: "plus")
                                }
                            }
                            .tint(.green)
                        }
                        Button(action: {
                            viewModel.selectedItem = item
                            showingEditSheet = true
                        }) {
                            Label("Edit", systemImage: "square.and.pencil")
                        }
                        .tint(.blue)
                    }
                }

            }
                
            if viewModel.hasNextPage {
                ProgressView()
                    .onAppear {
                        viewModel.getUserMediaList()
                    }
            }
        }//:List
        .searchable(text: $viewModel.searchText)
        .refreshable {
            viewModel.refreshList()
        }
        .onChange(of: viewModel.sort) { _ in
            viewModel.refreshList()
        }
        .onAppear {
            viewModel.mediaType = type
            viewModel.mediaListStatus = status
        }
        .sheet(isPresented: $showingEditSheet) {
            if viewModel.selectedItem != nil {
                MediaListEditView(mediaId: viewModel.selectedItem!.mediaId, mediaType: type, mediaList: viewModel.selectedItem!.fragments.basicMediaListEntry) {
                    viewModel.refreshList()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Menu {
                    Picker("Sort", selection: $viewModel.sort) {
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
    }
}

struct MediaListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MediaListView(type: .anime, status: .current)
            MediaListView(type: .anime, status: .repeating)
        }
    }
}
