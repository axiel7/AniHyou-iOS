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
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ExploreView(viewModel: viewModel)
                .navigationTitle("Explore")
        }
        .navigationViewStyle(.stack)
        .searchable(text: $viewModel.search, placement: .navigationBarDrawer, prompt: "Anime, Manga, and More")
        .onSubmit(of: .search) {
            viewModel.runSearch()
        }
        .onChange(of: viewModel.type) { _ in viewModel.runSearch() }
    }
}

struct RootExploreView_Previews: PreviewProvider {
    static var previews: some View {
        RootExploreView()
    }
}
