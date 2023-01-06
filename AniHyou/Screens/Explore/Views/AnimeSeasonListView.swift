//
//  AnimeSeasonListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 06/01/2023.
//

import SwiftUI
import API

struct AnimeSeasonListView: View {
    
    var season: MediaSeason
    private let currentYear = Date.now.year
    @State var selectedYear = Date.now.year
    @StateObject private var viewModel = ExploreViewModel()
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns) {
                ForEach(viewModel.animeSeasonal, id: \.?.id) {
                    if let media = $0 {
                        NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                            VListItemView(title: media.title?.userPreferred ?? "", imageUrl: media.coverImage?.large)
                        }
                    }
                }
                
                if viewModel.hasNextPageSeason {
                    ProgressView()
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

struct AnimeSeasonListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimeSeasonListView(season: .spring)
        }
    }
}
