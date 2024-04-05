//
//  AnimeSeasonListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 06/01/2023.
//

import SwiftUI
import AniListAPI

extension SeasonalAnimeQuery.Data.Page.Medium {
    var airingText: String? {
        if let schedule = nextAiringEpisode {
            let relativeDate = Date(
                timeIntervalSince1970: Double(schedule.airingAt)
            ).formatted(.relative(presentation: .numeric))
            return "Ep \(schedule.episode) \(relativeDate)"
        } else {
            return nil
        }
    }
    
    var mainGenresLocalized: Text? {
        genres?.prefix(3).compactMap({ $0?.genreLocalized }).joined(separator: ", ")
    }
}

struct AnimeSeasonListView: View {
    
    private enum ListStyle: Int {
        case grid
        case list
    }

    @State var season: MediaSeason
    private let currentYear = Date.now.year
    @State var selectedYear = Date.now.year
    @AppStorage(SEASON_LIST_STYLE_KEY) private var listStyle: ListStyle = .grid
    @StateObject private var viewModel = ExploreViewModel()
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15), alignment: .top)
    ]

    var body: some View {
        ScrollView {
            Group {
                switch listStyle {
                case .grid:
                    grid
                case .list:
                    list
                }
            }
            .animation(.default, value: listStyle)
        }
        .navigationTitle(season.localizedName + " \(selectedYear)")
        .toolbar {
            ToolbarItemGroup {
                toolbarContent
            }
        }
    }
    
    var grid: some View {
        LazyVGrid(columns: gridColumns) {
            ForEach(viewModel.animeSeasonal, id: \.id) { media in
                NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                    VListItemView(
                        title: media.title?.userPreferred ?? "",
                        imageUrl: media.coverImage?.large,
                        meanScore: media.meanScore,
                        status: media.mediaListEntry?.status?.value
                    )
                    .mediaContextMenu(
                        mediaId: media.id,
                        mediaType: .anime,
                        mediaListStatus: media.mediaListEntry?.status?.value
                    )
                }
                .buttonStyle(.plain)
            }

            if viewModel.hasNextPageSeason {
                HorizontalProgressView()
                    .onAppear {
                        viewModel.getAnimeSeasonal(season: season, year: selectedYear)
                    }
            }
        }
        .padding(.horizontal)
    }
    
    var list: some View {
        LazyVStack(alignment: .leading) {
            ForEach(viewModel.animeSeasonal, id: \.id) { media in
                NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                    HListItemWithSubtitleView(
                        title: media.title?.userPreferred,
                        subtitle: media.airingText,
                        subtitle2Text: media.mainGenresLocalized,
                        imageUrl: media.coverImage?.large
                    )
                    .mediaContextMenu(
                        mediaId: media.id,
                        mediaType: .anime,
                        mediaListStatus: media.mediaListEntry?.status?.value
                    )
                }
                .buttonStyle(.plain)
                .padding(.vertical, 4)
            }
            
            if viewModel.hasNextPageSeason {
                HorizontalProgressView()
                    .onAppear {
                        viewModel.getAnimeSeasonal(season: season, year: selectedYear)
                    }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    var toolbarContent: some View {
        Button {
            withAnimation {
                switch listStyle {
                case .grid:
                    listStyle = .list
                case .list:
                    listStyle = .grid
                }
            }
        } label: {
            Image(systemName: listStyle == .grid ? "list.bullet" : "square.grid.2x2")
        }
        Menu {
            Menu("Season") {
                Picker("Season", selection: $season) {
                    ForEach(MediaSeason.allCases, id: \.self) {
                        Text($0.localizedName)
                    }
                }
                .onChange(of: season) { season in
                    viewModel.getAnimeSeasonal(season: season, year: selectedYear, resetPage: true)
                }
            }
            Menu("Year") {
                Picker("Year", selection: $selectedYear) {
                    ForEach((1940...(currentYear+1)).reversed(), id: \.self) {
                        Text(String($0))
                    }
                }
                .onChange(of: selectedYear) { year in
                    viewModel.getAnimeSeasonal(season: season, year: year, resetPage: true)
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
        }
    }
}

#Preview {
    NavigationStack {
        AnimeSeasonListView(season: .spring)
    }
}
