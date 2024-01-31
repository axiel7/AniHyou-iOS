//
//  MediaListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import AniListAPI

struct MediaListView: View {

    let type: MediaType
    let status: MediaListStatus
    var userId: Int?
    var isEditable: Bool {
        return userId == nil
    }
    @StateObject private var viewModel = MediaListViewModel()
    @State private var showingEditSheet = false
    @AppStorage(LIST_SORT) private var sort = MediaListSort.updatedTimeDesc
    @AppStorage(LIST_SORT_ORDER) private var sortAscending = false
    @AppStorage(LIST_STYLE_KEY) private var listStyle = 0
    @AppStorage(INCREMENT_LONG_SWIPE_DIRECTION_KEY) private var incrementLongSwipeDirection: LongSwipeDirection = .right

    var body: some View {
        List {
            ForEach(viewModel.filteredMediaList, id: \.?.uniqueListId) {
                if let item = $0 {
                    buildListItem(item: item)
                }
            }

            if viewModel.hasNextPage && viewModel.searchText.isEmpty {
                HorizontalProgressView()
                    .onAppear {
                        viewModel.getUserMediaList(otherUserId: userId)
                    }
            }
        }//:List
        .listStyle(.inset)
        .searchable(text: $viewModel.searchText)
        .refreshable {
            viewModel.refreshList()
        }
        .onChange(of: sort) { newValue in
            viewModel.onSortChanged(newValue, isAscending: sortAscending)
        }
        .onChange(of: sortAscending) { newValue in
            viewModel.onSortChanged(sort, isAscending: newValue)
        }
        .onAppear {
            viewModel.mediaType = type
            viewModel.mediaListStatus = status
            viewModel.onSortChanged(sort, isAscending: sortAscending)
        }
        .sheet(isPresented: $showingEditSheet) {
            if let item = viewModel.selectedItem {
                MediaListEditView(
                    mediaId: item.mediaId,
                    mediaType: type,
                    mediaList: item.fragments.basicMediaListEntry,
                    onSave: { updatedEntry in
                        viewModel.onEntryUpdated(
                            mediaId: updatedEntry.mediaId,
                            entryId: updatedEntry.id,
                            updatedEntry: updatedEntry,
                            progress: nil
                        )
                    },
                    onDelete: {
                        viewModel.onEntryDeleted(entryId: item.id)
                    }
                )
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Menu {
                    Picker("Sort", selection: $sort) {
                        ForEach(MediaListSort.allCasesForUi, id: \.self) {
                            Text($0.localizedName).tag($0)
                        }
                    }
                    Picker("Order", selection: $sortAscending) {
                        Text("Ascending").tag(true)
                        Text("Descending").tag(false)
                    }
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                }
            }
        }
        .navigationTitle(viewModel.mediaListStatus.localizedName)
    }

    // swiftlint:disable cyclomatic_complexity function_body_length
    func buildListItem(item: UserMediaListQuery.Data.Page.MediaList!) -> some View {
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
        .swipeActions(edge: .leading) {
            if isEditable {
                if incrementLongSwipeDirection == .right {
                    if shouldShowIncrementButton {
                        Button(
                            action: {
                                updateEntryProgress(item: item)
                            },
                            label: {
                                if type == .anime {
                                    Label("Ep", systemImage: "plus")
                                    // should show a sheet to add a rating
                                } else if type == .manga {
                                    Label("Ch", systemImage: "plus")
                                }
                            }
                        )
                        .tint(.green)
                    }
                }
            }
        }
        .swipeActions(edge: .trailing) {
            if isEditable {
                if incrementLongSwipeDirection == .left {
                    if shouldShowIncrementButton {
                        Button(
                            action: {
                                updateEntryProgress(item: item)
                            },
                            label: {
                                if type == .anime {
                                    Label("Ep", systemImage: "plus")
                                    // should show a sheet to add a rating
                                } else if type == .manga {
                                    Label("Ch", systemImage: "plus")
                                }
                            }
                        )
                        .tint(.green)
                    }
                }
                Button(
                    action: {
                        viewModel.selectedItem = item
                        showingEditSheet = true
                    },
                    label: {
                        Label("Edit", systemImage: "square.and.pencil")
                    }
                )
                .tint(.blue)
            }
        }
        .mediaContextMenu(mediaId: item.mediaId, mediaType: type, mediaListStatus: item.status?.value)
    }
    // swiftlint:enable cyclomatic_complexity function_body_length

    func updateEntryProgress(item: UserMediaListQuery.Data.Page.MediaList!) {
        var status: MediaListStatus?
        if item.status == .planning {
            status = .current
        }
        viewModel.updateEntryProgress(
            mediaId: item.mediaId,
            entryId: item.id,
            progress: item.progress! + 1,
            status: status
        )
    }

    private var shouldShowIncrementButton: Bool {
        if viewModel.mediaListStatus == .repeating ||
            viewModel.mediaListStatus == .current ||
            viewModel.mediaListStatus == .planning {
            return true
        }
        return false
    }
}

#Preview {
    NavigationStack {
        MediaListView(type: .anime, status: .current)
        MediaListView(type: .anime, status: .repeating)
    }
}
