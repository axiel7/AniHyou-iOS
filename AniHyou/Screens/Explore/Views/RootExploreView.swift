//
//  RootExploreView.swift
//  AniHyou
//
//  Created by Axel Lopez on 30/6/22.
//
// This annoying view is required because `isSearching` enviroment variable
// is only available on a child view with a searchable parent view

import SwiftUI

struct RootExploreView: View {

    @StateObject private var viewModel = SearchViewModel()
    @State private var showingMediaDetails = false
    @State private var mediaId = 0

    var body: some View {
        NavigationStack {
            ExploreView(viewModel: viewModel)
                .navigationTitle("Explore")
                .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
        }
        .searchable(text: $viewModel.search, placement: .navigationBarDrawer, prompt: "Anime, Manga, and More")
        .onSubmit(of: .search) {
            viewModel.runSearch()
        }
        .onChange(of: viewModel.type) { _ in viewModel.runSearch() }
    }
}

#Preview {
    RootExploreView()
}
