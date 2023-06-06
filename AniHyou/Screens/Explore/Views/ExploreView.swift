//
//  ExploreView.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import SwiftUI
import AniListAPI

private let cardHeight: CGFloat = 90

struct ExploreView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @Environment(\.isSearching) private var isSearching
    @State private var isGenreSheetPresented = false
    
    var body: some View {
        ZStack {
            if isSearching {
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
                        
                        genreTagSelector
                        
                        ForEach(viewModel.searchedMedia, id: \.?.id) { item in
                            if item != nil {
                                NavigationLink(destination: MediaDetailsView(mediaId: item!.id)) {
                                    HListItemWithSubtitleView(title: item!.title?.userPreferred, subtitle: "\(item!.format?.value?.localizedName ?? "") · \(item!.startDate?.year?.stringValue ?? "")", imageUrl: item!.coverImage?.large)
                                }
                            }
                        }
                    case .characters:
                        ForEach(viewModel.searchedCharacters, id: \.?.id) { item in
                            if item != nil {
                                NavigationLink(destination: CharacterDetailsView(characterId: item!.id)) {
                                    HListItemWithSubtitleView(title: item!.name?.userPreferred, imageUrl: item!.image?.medium)
                                }
                            }
                        }
                    case .staff:
                        ForEach(viewModel.searchedStaff, id: \.?.id) { item in
                            if item != nil {
                                NavigationLink(destination: StaffDetailsView(staffId: item!.id)) {
                                    HListItemWithSubtitleView(title: item!.name?.userPreferred, imageUrl: item!.image?.medium)
                                }
                            }
                        }
                    case .studios:
                        ForEach(viewModel.searchedStudios, id: \.?.id) { item in
                            if item != nil {
                                NavigationLink(destination: StudioDetailsView(studioId: item!.id)) {
                                    HListItemWithSubtitleView(title: item!.name)
                                }
                            }
                        }
                    case .users:
                        ForEach(viewModel.searchedUsers, id: \.?.id) { item in
                            if item != nil {
                                NavigationLink(destination: ProfileView(userId: item!.id)) {
                                    HListItemWithSubtitleView(title: item!.name, imageUrl: item!.avatar?.medium)
                                }
                            }
                        }
                    }//:switch
                }//:List
                .listStyle(.insetGrouped)
                
            } else {//not searched
                preSearchView
            }//:else
        }//:ZStack
    }
    
    private var preSearchView: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {

                //MARK: - Anime
                Text("Anime")
                    .font(.title2)
                    .bold()
                    .padding(.top, 8)
                    .padding(.leading, 15)
                Divider()
                    .padding(.horizontal)

                //MARK: top
                HStack(alignment: .center) {
                    NavigationLink(destination: MediaChartListView(title: "Top 100 Anime", type: .anime, sort: .scoreDesc)) {
                        Label("Top 100", systemImage: "crown.fill")
                            .foregroundColor(.purple)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    NavigationLink(destination: MediaChartListView(title: "Popular Anime", type: .anime, sort: .popularityDesc)) {
                        Label("Top Popular", systemImage: "chart.line.uptrend.xyaxis")
                            .foregroundColor(.red)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }//:HStack
                .padding(.horizontal)
                .padding(.vertical, 8)
                
                //MARK: Spring, Summer
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
                
                //MARK: Fall, Winter
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
                
                //MARK: Calendar
                HStack {
                    NavigationLink(destination: CalendarAnimeView()) {
                        Label("Calendar", systemImage: "calendar")
                            .foregroundColor(.orange)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                
                //MARK: - Manga
                Text("Manga")
                    .font(.title2)
                    .bold()
                    .padding(.top, 8)
                    .padding(.leading, 15)
                Divider()
                    .padding(.horizontal)
                
                HStack(alignment: .center) {
                    NavigationLink(destination: MediaChartListView(title: "Top 100 Manga", type: .manga, sort: .scoreDesc)) {
                        Label("Top 100", systemImage: "crown.fill")
                            .foregroundColor(.purple)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    NavigationLink(destination: MediaChartListView(title: "Popular Manga", type: .manga, sort: .popularityDesc)) {
                        Label("Top Popular", systemImage: "chart.line.uptrend.xyaxis")
                            .foregroundColor(.red)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }//:VStack
        }//:VScrollView
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
        Button(action: { isGenreSheetPresented.toggle() }) {
            HStack {
                Text("Genres")
                    .foregroundColor(.primary)
                Spacer()
                Text(viewModel.selectedGenresTagsJoined)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }//:HStack
        }//:Button
        .sheet(isPresented: $isGenreSheetPresented) {
            GenreTagSelectionView(viewModel: viewModel, onDone: {
                viewModel.runSearch()
            })
        }//:Sheet
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(viewModel: SearchViewModel())
    }
}
