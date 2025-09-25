//
//  ExploreView.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import SwiftUI
import AniListAPI

struct ExploreView: View {

    var viewModel: SearchViewModel
    @Environment(\.isSearching) private var isSearching

    var body: some View {
        if isSearching {
            SearchView(viewModel: viewModel)
        } else {
            DiscoverView()
        }
    }
}

#Preview {
    ExploreView(viewModel: SearchViewModel())
}
