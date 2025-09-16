//
//  SearchView.swift
//  AniHyou
//
//  Created by Axel Lopez on 16/9/25.
//

import SwiftUI
import AniListAPI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @State private var isGenreSheetPresented = false
    @State private var isMediaFormatSheetPresented = false
    @State private var isMediaStatusPresented = false
    @State private var isYearSheetPresented = false
    @State private var showingMoreFilters = false
    private let currentYear = Date.now.year
    
    var body: some View {
        List {
            Picker("Search type", selection: $viewModel.type) {
                ForEach(SearchType.allCases, id: \.self) { type in
                    Label(type.localizedName, systemImage: type.systemImage)
                }
            }
            .pickerStyle(.menu)

            switch viewModel.type {
            case .anime, .manga:

                mediaSortSelector

                if showingMoreFilters {

                    genreTagSelector

                    mediaFormatSelector

                    mediaStatusSelector

                    Picker("From year", selection: $viewModel.yearFrom) {
                        Text("None").tag(Optional<Int>(nil))
                        ForEach((1940...(currentYear+1)).reversed(), id: \.self) {
                            Text(String($0)).tag(Optional($0))
                        }
                    }
                    .onChange(of: viewModel.yearFrom) {
                        Task {
                            await viewModel.runSearch()
                        }
                    }
                    
                    Picker("To year", selection: $viewModel.yearTo) {
                        Text("None").tag(Optional<Int>(nil))
                        let startYear = (viewModel.yearFrom ?? 1940) + 1
                        ForEach((startYear...(currentYear+1)).reversed(), id: \.self) {
                            Text(String($0)).tag(Optional($0))
                        }
                    }
                    .onChange(of: viewModel.yearTo) {
                        Task {
                            await viewModel.runSearch()
                        }
                    }
                    
                    Picker("Season", selection: $viewModel.season) {
                        Text("None").tag(Optional<MediaSeason>(nil))
                        ForEach(MediaSeason.allCases, id: \.self) {
                            Text($0.localizedName).tag(Optional($0))
                        }
                    }
                    .onChange(of: viewModel.season) {
                        Task {
                            await viewModel.runSearch()
                        }
                    }
                    
                    Picker("Country", selection: $viewModel.country) {
                        Text("None").tag(Optional<CountryOfOrigin>(nil))
                        ForEach(CountryOfOrigin.allCases, id: \.self) {
                            Text($0.localizedName).tag(Optional($0))
                        }
                    }
                    .onChange(of: viewModel.country) {
                        Task {
                            await viewModel.runSearch()
                        }
                    }
                    
                    TriPicker("On my list", selection: $viewModel.mediaOnMyList)
                        .onChange(of: viewModel.mediaOnMyList) {
                            Task {
                                await viewModel.runSearch()
                            }
                        }
                    
                    TriPicker("Doujinshi", selection: $viewModel.isDoujinshi)
                        .onChange(of: viewModel.isDoujinshi) {
                            Task {
                                await viewModel.runSearch()
                            }
                        }
                    
                    TriPicker("Adult", selection: $viewModel.isAdult)
                        .onChange(of: viewModel.isAdult) {
                            Task {
                                await viewModel.runSearch()
                            }
                        }
                    
                    Button("Clear", role: .destructive) {
                        viewModel.clearFilters()
                    }

                    Button("Hide filters") {
                        withAnimation {
                            showingMoreFilters = false
                        }
                    }
                } else {
                    Button("More filters") {
                        withAnimation {
                            showingMoreFilters = true
                        }
                    }
                }

                ForEach(viewModel.searchedMedia, id: \.id) { item in
                    let startYear = if let year = item.startDate?.year {
                        String(year)
                    } else {
                        "Unknown"
                    }
                    NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                        HListItemWithSubtitleView(
                            title: item.title?.userPreferred,
                            twoSubtitleTexts: (
                                item.format?.value?.localizedName,
                                "\(startYear)"
                            ),
                            imageUrl: item.coverImage?.large,
                            status: item.mediaListEntry?.status?.value
                        )
                        .mediaContextMenu(
                            mediaId: item.id,
                            mediaType: item.type?.value,
                            mediaListStatus: item.mediaListEntry?.status?.value
                        )
                    }
                    .buttonStyle(.plain)
                }
            case .characters:
                ForEach(viewModel.searchedCharacters, id: \.id) { item in
                    NavigationLink(destination: CharacterDetailsView(characterId: item.id)) {
                        HListItemWithSubtitleView(title: item.name?.userPreferred, imageUrl: item.image?.medium)
                    }
                    .buttonStyle(.plain)
                }
            case .staff:
                ForEach(viewModel.searchedStaff, id: \.id) { item in
                    NavigationLink(destination: StaffDetailsView(staffId: item.id)) {
                        HListItemWithSubtitleView(title: item.name?.userPreferred, imageUrl: item.image?.medium)
                    }
                    .buttonStyle(.plain)
                }
            case .studios:
                ForEach(viewModel.searchedStudios, id: \.id) { item in
                    NavigationLink(destination: StudioDetailsView(studioId: item.id)) {
                        HListItemWithSubtitleView(title: item.name)
                    }
                    .buttonStyle(.plain)
                }
            case .users:
                ForEach(viewModel.searchedUsers, id: \.id) { item in
                    NavigationLink(destination: ProfileView(userId: item.id)) {
                        HListItemWithSubtitleView(title: item.name, imageUrl: item.avatar?.medium)
                    }
                    .buttonStyle(.plain)
                }
            }//:switch
            
            if viewModel.isLoading {
                HorizontalProgressView()
            }
        }//:List
        .listStyle(.insetGrouped)
    }
    
    @ViewBuilder
    private var mediaSortSelector: some View {
        Picker("Sort", selection: $viewModel.sortMedia) {
            Text("Default").tag(MediaSort.searchMatch)
            Text("Popularity").tag(MediaSort.popularityDesc)
            Text("Score").tag(MediaSort.scoreDesc)
            Text("Trending").tag(MediaSort.trendingDesc)
            Text("Favorites").tag(MediaSort.favouritesDesc)
            Text("Release Date").tag(MediaSort.startDateDesc)
        }
        .onChange(of: viewModel.sortMedia) {
            Task {
                await viewModel.runSearch()
            }
        }
        if viewModel.sortMedia != .searchMatch {
            Picker("Order", selection: $viewModel.isAscending) {
                Text("Ascending").tag(true)
                Text("Descending").tag(false)
            }
            .onChange(of: viewModel.isAscending) {
                Task {
                    await viewModel.onChangeSortOrder()
                }
            }
        }
    }

    private var genreTagSelector: some View {
        Button(action: { isGenreSheetPresented.toggle() }, label: {
            HStack {
                Text("Genres")
                    .foregroundStyle(.primary)
                Spacer()
                Text(viewModel.selectedGenresTagsJoined)
                    .foregroundStyle(.gray)
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }//:HStack
        })//:Button
        .sheet(isPresented: $isGenreSheetPresented) {
            GenreTagSelectionView(
                viewModel: viewModel,
                onDone: {
                    Task {
                        await viewModel.runSearch()
                    }
                }
            )
            .onAppear {
                if viewModel.search.isEmpty {
                    viewModel.search = " "
                }
            }
        }//:Sheet
    }

    private var mediaFormatSelector: some View {
        Button(action: { isMediaFormatSheetPresented.toggle() }, label: {
            HStack {
                Text("Format")
                    .foregroundStyle(.primary)
                Spacer()
                ForEach(Array(viewModel.selectedMediaFormat.prefix(3)), id: \.self) { status in
                    Text(status.localizedName)
                }
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }//:HStack
        })//:Button
        .sheet(isPresented: $isMediaFormatSheetPresented) {
            MultiSelectionSheet(
                values: MediaFormat.allCases(mediaType: viewModel.mediaType),
                selectedValues: $viewModel.selectedMediaFormat,
                onDone: {
                    Task {
                        await viewModel.runSearch()
                    }
                },
                rowContent: { format in
                    Text(format.localizedName)
                }
            )
            .onAppear {
                if viewModel.search.isEmpty {
                    viewModel.search = " "
                }
            }
        }//:Sheet
    }

    private var mediaStatusSelector: some View {
        Button(action: { isMediaStatusPresented.toggle() }, label: {
            HStack {
                Text("Status")
                    .foregroundStyle(.primary)
                Spacer()
                ForEach(Array(viewModel.selectedMediaStatus.prefix(3)), id: \.self) { status in
                    Text(status.localizedName)
                }
                .foregroundStyle(.gray)
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }//:HStack
        })//:Button
        .sheet(isPresented: $isMediaStatusPresented) {
            MultiSelectionSheet(
                values: MediaStatus.allCases,
                selectedValues: $viewModel.selectedMediaStatus,
                onDone: {
                    Task {
                        await viewModel.runSearch()
                    }
                },
                rowContent: { status in
                    Text(status.localizedName)
                }
            )
            .onAppear {
                if viewModel.search.isEmpty {
                    viewModel.search = " "
                }
            }
        }//:Sheet
    }
}
