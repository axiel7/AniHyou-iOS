//
//  ExploreView.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import SwiftUI
import AniListAPI

private let cardHeight: CGFloat = 90

// swiftlint:disable syntactic_sugar type_body_length file_length
struct ExploreView: View {

    @ObservedObject var viewModel: SearchViewModel
    @Environment(\.isSearching) private var isSearching
    @State private var isGenreSheetPresented = false
    @State private var isMediaFormatSheetPresented = false
    @State private var isMediaStatusPresented = false
    @State private var isYearSheetPresented = false
    @State private var showingMoreFilters = false
    private let currentYear = Date.now.year

    var body: some View {
        ZStack {
            if isSearching {
                searchingView
            } else {
                preSearchView
            }
        }//:ZStack
    }

    private var searchingView: some View {
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
                    .onChange(of: viewModel.yearFrom) { _ in
                        viewModel.runSearch()
                    }
                    
                    Picker("To year", selection: $viewModel.yearTo) {
                        Text("None").tag(Optional<Int>(nil))
                        let startYear = (viewModel.yearFrom ?? 1940) + 1
                        ForEach((startYear...(currentYear+1)).reversed(), id: \.self) {
                            Text(String($0)).tag(Optional($0))
                        }
                    }
                    .onChange(of: viewModel.yearTo) { _ in
                        viewModel.runSearch()
                    }
                    
                    Picker("Country", selection: $viewModel.country) {
                        Text("None").tag(Optional<CountryOfOrigin>(nil))
                        ForEach(CountryOfOrigin.allCases, id: \.self) {
                            Text($0.localized).tag(Optional($0))
                        }
                    }
                    .onChange(of: viewModel.country) { _ in
                        viewModel.runSearch()
                    }
                    
                    TriPicker("On my list", selection: $viewModel.mediaOnMyList)
                        .onChange(of: viewModel.mediaOnMyList) { _ in
                            viewModel.runSearch()
                        }
                    
                    TriPicker("Doujinshi", selection: $viewModel.isDoujinshi)
                        .onChange(of: viewModel.isDoujinshi) { _ in
                            viewModel.runSearch()
                        }
                    
                    TriPicker("Adult", selection: $viewModel.isAdult)
                        .onChange(of: viewModel.isAdult) { _ in
                            viewModel.runSearch()
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

                ForEach(viewModel.searchedMedia, id: \.?.id) { item in
                    if let item {
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
                                imageUrl: item.coverImage?.large
                            )
                            .mediaContextMenu(
                                mediaId: item.id,
                                mediaType: item.type?.value,
                                mediaListStatus: item.mediaListEntry?.status?.value
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
            case .characters:
                ForEach(viewModel.searchedCharacters, id: \.?.id) { item in
                    if let item {
                        NavigationLink(destination: CharacterDetailsView(characterId: item.id)) {
                            HListItemWithSubtitleView(title: item.name?.userPreferred, imageUrl: item.image?.medium)
                        }
                        .buttonStyle(.plain)
                    }
                }
            case .staff:
                ForEach(viewModel.searchedStaff, id: \.?.id) { item in
                    if let item {
                        NavigationLink(destination: StaffDetailsView(staffId: item.id)) {
                            HListItemWithSubtitleView(title: item.name?.userPreferred, imageUrl: item.image?.medium)
                        }
                        .buttonStyle(.plain)
                    }
                }
            case .studios:
                ForEach(viewModel.searchedStudios, id: \.?.id) { item in
                    if let item {
                        NavigationLink(destination: StudioDetailsView(studioId: item.id)) {
                            HListItemWithSubtitleView(title: item.name)
                        }
                        .buttonStyle(.plain)
                    }
                }
            case .users:
                ForEach(viewModel.searchedUsers, id: \.?.id) { item in
                    if let item {
                        NavigationLink(destination: ProfileView(userId: item.id)) {
                            HListItemWithSubtitleView(title: item.name, imageUrl: item.avatar?.medium)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }//:switch
            
            if viewModel.isLoading {
                HorizontalProgressView()
            }
        }//:List
        .listStyle(.insetGrouped)
    }

    private var preSearchView: some View {
        ScrollView(.vertical) {
            Grid(
                alignment: .leading,
                verticalSpacing: 24
            ) {
                // MARK: - Anime
                VStack(alignment: .leading, spacing: 12) {
                    Text("Anime")
                        .font(.title2)
                        .bold()
                        .padding(.top, 8)
                    Divider()
                }

                animeCharts

                // MARK: - Manga
                VStack(alignment: .leading, spacing: 12) {
                    Text("Manga")
                        .font(.title2)
                        .bold()
                        .padding(.top, 8)
                    Divider()
                }

                mangaCharts
            }//:Grid
            .padding(.horizontal)
        }//:VScrollView
    }

    @ViewBuilder
    private var animeCharts: some View {
        // MARK: Top 100, Top Popular
        GridRow {
            NavigationLink(
                destination: MediaChartListView(
                    title: "Top 100 Anime",
                    type: .anime,
                    sort: .scoreDesc
                )
            ) {
                Label("Top 100", systemImage: "crown.fill")
                    .foregroundStyle(.purple)
            }
            NavigationLink(
                destination: MediaChartListView(title: "Popular Anime", type: .anime, sort: .popularityDesc)
            ) {
                Label("Top Popular", systemImage: "chart.line.uptrend.xyaxis")
                    .foregroundStyle(.red)
            }
        }
        // MARK: Upcoming, Airing
        GridRow {
            NavigationLink(
                destination: MediaChartListView(
                    title: "Upcoming Anime",
                    type: .anime,
                    sort: .popularityDesc,
                    status: .notYetReleased
                )
            ) {
                Label("Upcoming", systemImage: "clock.fill")
                    .foregroundStyle(.pink)
            }
            NavigationLink(
                destination: MediaChartListView(
                    title: "Airing Anime",
                    type: .anime,
                    sort: .scoreDesc,
                    status: .releasing
                )
            ) {
                Label("Airing", systemImage: "antenna.radiowaves.left.and.right")
                    .foregroundStyle(.indigo)
            }
        }
        // MARK: Spring, Summer
        GridRow {
            NavigationLink(destination: AnimeSeasonListView(season: .spring)) {
                Label("Spring", systemImage: "leaf.fill")
                    .foregroundStyle(.green)
            }
            NavigationLink(destination: AnimeSeasonListView(season: .summer)) {
                Label("Summer", systemImage: "sun.max.fill")
                    .foregroundStyle(.yellow)
            }
        }
        // MARK: Fall, Winter
        GridRow {
            
            NavigationLink(destination: AnimeSeasonListView(season: .fall)) {
                Label("Fall", systemImage: "cloud.rain.fill")
                    .foregroundStyle(.brown)
            }
            NavigationLink(destination: AnimeSeasonListView(season: .winter)) {
                Label("Winter", systemImage: "snowflake")
                    .foregroundStyle(.blue)
            }
        }
        // MARK: Top Movies, Calendar
        GridRow {
            NavigationLink(destination: MediaChartListView(
                title: "Top Movies",
                type: .anime,
                sort: .scoreDesc,
                format: .movie
            )) {
                Label("Top Movies", systemImage: "film")
                    .foregroundStyle(.teal)
            }
            NavigationLink(destination: CalendarAnimeView()) {
                Label("Calendar", systemImage: "calendar")
                    .foregroundStyle(.orange)
            }
        }
    }

    @ViewBuilder
    private var mangaCharts: some View {
        // MARK: Top 100, Top Popular
        GridRow {
            NavigationLink(destination: MediaChartListView(title: "Top 100 Manga", type: .manga, sort: .scoreDesc)) {
                Label("Top 100", systemImage: "crown.fill")
                    .foregroundStyle(.purple)
            }
            NavigationLink(
                destination: MediaChartListView(title: "Popular Manga", type: .manga, sort: .popularityDesc)
            ) {
                Label("Top Popular", systemImage: "chart.line.uptrend.xyaxis")
                    .foregroundStyle(.red)
            }
        }
        // MARK: Upcoming, Publishing
        GridRow {
            NavigationLink(
                destination: MediaChartListView(
                    title: "Upcoming Manga",
                    type: .manga,
                    sort: .popularityDesc,
                    status: .notYetReleased
                )
            ) {
                Label("Upcoming", systemImage: "clock.fill")
                    .foregroundStyle(.pink)
            }
            NavigationLink(
                destination: MediaChartListView(
                    title: "Publishing Manga",
                    type: .manga,
                    sort: .scoreDesc,
                    status: .releasing
                )
            ) {
                Label("Publishing", systemImage: "pencil.line")
                    .foregroundStyle(.indigo)
            }
        }
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
        .onChange(of: viewModel.sortMedia) { _ in
            viewModel.runSearch()
        }
        if viewModel.sortMedia != .searchMatch {
            Picker("Order", selection: $viewModel.isAscending) {
                Text("Ascending").tag(true)
                Text("Descending").tag(false)
            }
            .onChange(of: viewModel.isAscending) { _ in
                viewModel.onChangeSortOrder()
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
            GenreTagSelectionView(viewModel: viewModel, onDone: {
                viewModel.runSearch()
            })
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
                onDone: { viewModel.runSearch() },
                rowContent: { format in
                    Text(format.localizedName)
                }
            )
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
        .sheet(
            isPresented: $isMediaStatusPresented,
            onDismiss: { viewModel.runSearch() },
            content: {
                MultiSelectionSheet(
                    values: MediaStatus.allCases,
                    selectedValues: $viewModel.selectedMediaStatus,
                    onDone: { viewModel.runSearch() },
                    rowContent: { status in
                        Text(status.localizedName)
                    }
                )
            }
        )//:Sheet
    }
}

#Preview {
    ExploreView(viewModel: SearchViewModel())
}
// swiftlint:enable syntactic_sugar type_body_length file_length
