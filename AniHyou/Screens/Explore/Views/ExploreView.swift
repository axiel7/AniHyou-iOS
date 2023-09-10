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

                    Picker("Year", selection: $viewModel.selectedYear) {
                        Text("None").tag(Optional<Int>(nil))
                        ForEach((1940...(currentYear+1)).reversed(), id: \.self) {
                            Text(String($0)).tag(Optional($0))
                        }
                    }
                    .onChange(of: viewModel.selectedYear) { _ in
                        viewModel.runSearch()
                    }

                    Toggle("On my list", isOn: $viewModel.mediaOnMyList)
                        .onChange(of: viewModel.mediaOnMyList) { _ in
                            viewModel.runSearch()
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
                        NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                            HListItemWithSubtitleView(
                                title: item.title?.userPreferred,
                                subtitle: String(swiftLintMultiline:
                                    item.format?.value?.localizedName ?? "",
                                    " · ",
                                    item.startDate?.year?.stringValue ?? ""
                                ),
                                imageUrl: item.coverImage?.large
                            )
                            .mediaContextMenu(
                                mediaId: item.id,
                                mediaType: item.type?.value,
                                mediaListStatus: item.mediaListEntry?.status?.value
                            )
                        }
                    }
                }
            case .characters:
                ForEach(viewModel.searchedCharacters, id: \.?.id) { item in
                    if let item {
                        NavigationLink(destination: CharacterDetailsView(characterId: item.id)) {
                            HListItemWithSubtitleView(title: item.name?.userPreferred, imageUrl: item.image?.medium)
                        }
                    }
                }
            case .staff:
                ForEach(viewModel.searchedStaff, id: \.?.id) { item in
                    if let item {
                        NavigationLink(destination: StaffDetailsView(staffId: item.id)) {
                            HListItemWithSubtitleView(title: item.name?.userPreferred, imageUrl: item.image?.medium)
                        }
                    }
                }
            case .studios:
                ForEach(viewModel.searchedStudios, id: \.?.id) { item in
                    if let item {
                        NavigationLink(destination: StudioDetailsView(studioId: item.id)) {
                            HListItemWithSubtitleView(title: item.name)
                        }
                    }
                }
            case .users:
                ForEach(viewModel.searchedUsers, id: \.?.id) { item in
                    if let item {
                        NavigationLink(destination: ProfileView(userId: item.id)) {
                            HListItemWithSubtitleView(title: item.name, imageUrl: item.avatar?.medium)
                        }
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
            VStack(alignment: .leading) {

                // MARK: - Anime
                Text("Anime")
                    .font(.title2)
                    .bold()
                    .padding(.top, 8)
                    .padding(.leading, 15)
                Divider()
                    .padding(.horizontal)

                animeCharts

                // MARK: - Manga
                Text("Manga")
                    .font(.title2)
                    .bold()
                    .padding(.top, 8)
                    .padding(.leading, 15)
                Divider()
                    .padding(.horizontal)

                mangaCharts
            }//:VStack
        }//:VScrollView
    }

    @ViewBuilder
    private var animeCharts: some View {
        // MARK: top
        HStack(alignment: .center) {
            NavigationLink(destination: MediaChartListView(title: "Top 100 Anime", type: .anime, sort: .scoreDesc)) {
                Label("Top 100", systemImage: "crown.fill")
                    .foregroundColor(.purple)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            NavigationLink(
                destination: MediaChartListView(title: "Popular Anime", type: .anime, sort: .popularityDesc)
            ) {
                Label("Top Popular", systemImage: "chart.line.uptrend.xyaxis")
                    .foregroundColor(.red)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }//:HStack
        .padding(.horizontal)
        .padding(.vertical, 8)

        // MARK: upcoming, airing
        HStack(alignment: .center) {
            NavigationLink(
                destination: MediaChartListView(
                    title: "Upcoming Anime",
                    type: .anime,
                    sort: .popularityDesc,
                    status: .notYetReleased
                )
            ) {
                Label("Upcoming", systemImage: "clock.fill")
                    .foregroundColor(.pink)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            NavigationLink(
                destination: MediaChartListView(
                    title: "Airing Anime",
                    type: .anime,
                    sort: .scoreDesc,
                    status: .releasing
                )
            ) {
                Label("Airing", systemImage: "antenna.radiowaves.left.and.right")
                    .foregroundColor(.indigo)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }//:HStack
        .padding(.horizontal)
        .padding(.vertical, 8)

        // MARK: Spring, Summer
        HStack(alignment: .center) {
            NavigationLink(destination: AnimeSeasonListView(season: .spring)) {
                Label("Spring", systemImage: "leaf.fill")
                    .foregroundColor(.green)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            NavigationLink(destination: AnimeSeasonListView(season: .summer)) {
                Label("Summer", systemImage: "sun.max.fill")
                    .foregroundColor(.yellow)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }//:HStack
        .padding(.horizontal)
        .padding(.vertical, 8)

        // MARK: Fall, Winter
        HStack(alignment: .center) {
            NavigationLink(destination: AnimeSeasonListView(season: .fall)) {
                Label("Fall", systemImage: "cloud.rain.fill")
                    .foregroundColor(.brown)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            NavigationLink(destination: AnimeSeasonListView(season: .winter)) {
                Label("Winter", systemImage: "snowflake")
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }//:HStack
        .padding(.horizontal)
        .padding(.vertical, 8)

        // MARK: Calendar
        HStack {
            NavigationLink(destination: CalendarAnimeView()) {
                Label("Calendar", systemImage: "calendar")
                    .foregroundColor(.orange)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }

    @ViewBuilder
    private var mangaCharts: some View {
        // MARK: top
        HStack(alignment: .center) {
            NavigationLink(destination: MediaChartListView(title: "Top 100 Manga", type: .manga, sort: .scoreDesc)) {
                Label("Top 100", systemImage: "crown.fill")
                    .foregroundColor(.purple)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            NavigationLink(
                destination: MediaChartListView(title: "Popular Manga", type: .manga, sort: .popularityDesc)
            ) {
                Label("Top Popular", systemImage: "chart.line.uptrend.xyaxis")
                    .foregroundColor(.red)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)

        // MARK: upcoming, publishing
        HStack(alignment: .center) {
            NavigationLink(
                destination: MediaChartListView(
                    title: "Upcoming Manga",
                    type: .manga,
                    sort: .popularityDesc,
                    status: .notYetReleased
                )
            ) {
                Label("Upcoming", systemImage: "clock.fill")
                    .foregroundColor(.pink)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            NavigationLink(
                destination: MediaChartListView(
                    title: "Publishing Manga",
                    type: .manga,
                    sort: .scoreDesc,
                    status: .releasing
                )
            ) {
                Label("Publishing", systemImage: "pencil.line")
                    .foregroundColor(.indigo)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }//:HStack
        .padding(.horizontal)
        .padding(.vertical, 8)
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
                    .foregroundColor(.primary)
                Spacer()
                Text(viewModel.selectedGenresTagsJoined)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
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
                    .foregroundColor(.primary)
                Spacer()
                Text(viewModel.selectedMediaFormatJoined)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }//:HStack
        })//:Button
        .sheet(isPresented: $isMediaFormatSheetPresented) {
            MultiSelectionSheet(
                values: MediaFormat.allCases,
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
                    .foregroundColor(.primary)
                Spacer()
                Text(viewModel.selectedMediaStatusJoined)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
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

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(viewModel: SearchViewModel())
    }
}
// swiftlint:enable syntactic_sugar type_body_length file_length
