//
//  AnimeSeasonListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 06/01/2023.
//

import SwiftUI
import AniListAPI

struct AnimeSeasonListView: View {

    let season: MediaSeason
    private let currentYear = Date.now.year
    @State var selectedYear = Date.now.year
    @StateObject private var viewModel = ExploreViewModel()
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15), alignment: .top)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns) {
                ForEach(viewModel.animeSeasonal, id: \.?.id) {
                    if let media = $0 {
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
        .navigationTitle(season.localizedName)
        .toolbar {
            Menu {
                Picker("Year", selection: $selectedYear) {
                    ForEach((1940...(currentYear+1)).reversed(), id: \.self) {
                        Text(String($0))
                    }
                }
                .onChange(of: selectedYear) { year in
                    viewModel.getAnimeSeasonal(season: season, year: year, resetPage: true)
                }
            } label: {
                Label(String(selectedYear), systemImage: "calendar")
            }
            .labelStyle(.titleAndIcon)
        }
    }
}

#Preview {
    NavigationStack {
        AnimeSeasonListView(season: .spring)
    }
}
