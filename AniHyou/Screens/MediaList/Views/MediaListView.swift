//
//  MediaListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import AniListAPI

private extension View {
    @ViewBuilder
    func listStyle() -> some View {
        if isPhone {
            self.listStyle(.inset)
        } else {
            self.listStyle(.automatic)
        }
    }
}

// swiftlint:disable:next type_body_length
struct MediaListView: View {

    let type: MediaType
    var userId: Int?
    var isMyList: Bool {
        userId == nil
    }
    private let currentYear = Date.now.year
    @Bindable var viewModel: MediaListViewModel
    @State private var showingEditSheet = false

    @AppStorage(LIST_SORT) private var sort = MediaListSort.updatedTimeDesc
    @AppStorage(LIST_SORT_ORDER) private var sortAscending = false
    @AppStorage(LIST_STYLE_KEY) private var listItemsStyle = 0
    @AppStorage(INCREMENT_LONG_SWIPE_DIRECTION_KEY) private var incrementLongSwipeDirection: LongSwipeDirection = .right
    @AppStorage(SHOW_LOW_PRIORITY) private var showLowPriority = false

    var body: some View {
        List {
            listContent
        }//:List
        .listStyle()
        .searchable(text: $viewModel.searchText)
        .refreshable {
            if viewModel.searchText.isEmpty {
                await viewModel.refreshList()
            }
        }
        .onSubmit(of: .search) {
            Task {
                await viewModel.filterList()
            }
        }
        .onChange(of: viewModel.searchText) {
            Task {
                try? await Task.sleep(for: .seconds(2))
                await viewModel.filterList()
            }
        }
        .onReceive(
            NotificationCenter.default.publisher(for: "updatedMediaListEntry")
        ) { notification in
            if let entry = notification.object as? BasicMediaListEntry {
                Task {
                    await viewModel.onEntryUpdated(entry)
                }
            }
        }
        .task {
            if userId == nil {
                await viewModel.onSortChanged(sort, isAscending: sortAscending)
            }
        }
        .sheet(isPresented: $showingEditSheet) {
            if let details = viewModel.selectedDetails,
               let entry = viewModel.selectedEntry
            {
                MediaListEditView(
                    mediaDetails: details,
                    mediaList: entry,
                    onSave: { entry in
                        Task {
                            await viewModel.onEntryUpdated(entry)
                        }
                    },
                    onDelete: {
                        viewModel.onEntryDeleted(entryId: entry.id)
                    }
                )
            }
        }
        .navigationDestination(isPresented: $viewModel.showingRandomEntry) {
            MediaDetailsView(mediaId: viewModel.randomId ?? 0)
        }
        .toolbar {
            toolbarContent
        }
        .navigationTitle(navigationTitle)
    }
    
    private var navigationTitle: String {
        if let status = viewModel.selectedListName?.localizedListStatus(
            mediaType: type
        ) {
            return status
        } else if let listName = viewModel.selectedListName {
            return listName
        } else {
            return String(localized: "All")
        }
    }
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItemGroup(placement: .primaryAction) {
            Menu {
                Menu("Sort") {
                    Picker("Sort", selection: $sort) {
                        ForEach(MediaListSort.allCasesForUi, id: \.self) {
                            Text($0.localizedName).tag($0)
                        }
                    }
                    .onChange(of: sort) {
                        Task {
                            await viewModel.onSortChanged(sort, isAscending: sortAscending)
                        }
                    }
                    
                    Picker("Order", selection: $sortAscending) {
                        Text("Ascending").tag(true)
                        Text("Descending").tag(false)
                    }
                    .onChange(of: sortAscending) {
                        Task {
                            await viewModel.onSortChanged(sort, isAscending: sortAscending)
                        }
                    }
                }
                
                Menu("Format") {
                    Picker("Format", selection: $viewModel.mediaFormat) {
                        let cases = if type == .anime {
                            MediaFormat.animeCases
                        } else {
                            MediaFormat.mangaCases
                        }
                        Text("None").tag(nil as MediaFormat?)
                        ForEach(cases, id: \.self) {
                            Text($0.localizedName).tag($0)
                        }
                    }
                    .onChange(of: viewModel.mediaFormat) {
                        Task { await viewModel.filterList() }
                    }
                }
                
                Menu("Status") {
                    Picker("Status", selection: $viewModel.mediaStatus) {
                        Text("None").tag(nil as MediaStatus?)
                        ForEach(MediaStatus.allCases, id: \.self) {
                            Text($0.localizedName).tag($0)
                        }
                    }
                    .onChange(of: viewModel.mediaStatus) {
                        Task { await viewModel.filterList() }
                    }
                }
                
                Menu("Country") {
                    Picker("Country", selection: $viewModel.country) {
                        Text("None").tag(nil as CountryOfOrigin?)
                        ForEach(CountryOfOrigin.allCases, id: \.self) {
                            Text($0.localizedName).tag($0)
                        }
                    }
                    .onChange(of: viewModel.country) {
                        Task { await viewModel.filterList() }
                    }
                }
                
                Menu("Year") {
                    Picker("Year", selection: $viewModel.year) {
                        Text("None").tag(nil as Int?)
                        ForEach((1940...(currentYear+1)).reversed(), id: \.self) {
                            Text(String($0)).tag($0)
                        }
                    }
                    .onChange(of: viewModel.year) {
                        Task { await viewModel.filterList() }
                    }
                }
                
                Button("Clear", role: .destructive) {
                    Task {
                        await viewModel.clearFilters()
                    }
                }
                
                Button("Random", systemImage: "shuffle") {
                    viewModel.getRandomEntryId()
                }
                .tint(nil)
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
            }
            .tint(nil)
        }
    }
    
    @ViewBuilder
    private var listContent: some View {
        if viewModel.hasFilters || viewModel.hasQuery {
            ForEach(viewModel.filteredMedia, id: \.uniqueListId) { item in
                if let details = item.media?.fragments.basicMediaDetails {
                    buildListItem(
                        details: details,
                        entry: item.fragments.basicMediaListEntry,
                        schedule: item.media?.nextAiringEpisode?.fragments.airingEpisode,
                        showStatus: viewModel.selectedListName == nil
                    )
                }
            }
        } else {
            ForEach(viewModel.mediaList, id: \.uniqueListId) { item in
                if let details = item.media?.fragments.basicMediaDetails {
                    buildListItem(
                        details: details,
                        entry: item.fragments.basicMediaListEntry,
                        schedule: item.media?.nextAiringEpisode?.fragments.airingEpisode,
                        showStatus: viewModel.selectedListName == nil
                    )
                }
            }
        }
        
        if viewModel.isLoading {
            HorizontalProgressView()
        }
    }

    @ViewBuilder
    // swiftlint:disable:next function_body_length
    private func buildListItem(
        details: BasicMediaDetails,
        entry: BasicMediaListEntry,
        schedule: AiringEpisode?,
        showStatus: Bool
    ) -> some View {
        NavigationLink(destination: MediaDetailsView(mediaId: details.id)) {
            switch listItemsStyle {
            case 1:
                MediaListItemMinimalView(
                    details: details,
                    entry: entry,
                    schedule: schedule,
                    showStatus: showStatus,
                    showLowPriority: showLowPriority
                )
            case 2:
                MediaListItemCompactView(
                    details: details,
                    entry: entry,
                    schedule: schedule,
                    showStatus: showStatus,
                    showLowPriority: showLowPriority
                )
            default:
                MediaListItemStandardView(
                    details: details,
                    entry: entry,
                    schedule: schedule,
                    showStatus: showStatus,
                    showLowPriority: showLowPriority
                )
            }
        }
        .swipeActions(edge: .leading) {
            if isMyList
                && incrementLongSwipeDirection == .right
                && entry.shouldShowIncrementButton
            {
                Button(
                    action: {
                        Task {
                            await viewModel.updateEntryProgress(entry: entry, details: details)
                        }
                    },
                    label: {
                        if type == .anime {
                            Label("Ep", systemImage: "plus")
                            // should show a sheet to add a rating
                        } else if type == .manga {
                            Label(entry.isVolumeProgress ? "Vol" : "Ch",
                                  systemImage: "plus"
                            )
                        }
                    }
                )
                .tint(.green)
            }
        }
        .swipeActions(edge: .trailing) {
            if isMyList {
                if incrementLongSwipeDirection == .left
                    && entry.shouldShowIncrementButton
                {
                    Button(
                        action: {
                            Task {
                                await viewModel.updateEntryProgress(entry: entry, details: details)
                            }
                        },
                        label: {
                            if type == .anime {
                                Label("Ep", systemImage: "plus")
                                // should show a sheet to add a rating
                            } else if type == .manga {
                                Label(entry.isVolumeProgress ? "Vol" : "Ch",
                                      systemImage: "plus"
                                )
                            }
                        }
                    )
                    .tint(.green)
                }
                Button(
                    action: {
                        viewModel.selectedDetails = details
                        viewModel.selectedEntry = entry
                        showingEditSheet = true
                    },
                    label: {
                        Label("Edit", systemImage: "square.and.pencil")
                    }
                )
                .tint(.blue)
            }
        }
        .mediaContextMenu(mediaId: details.id, mediaType: type, mediaListStatus: entry.status?.value)
    }
}

#Preview {
    NavigationStack {
        MediaListView(type: .anime, userId: 208863, viewModel: MediaListViewModel())
    }
}
