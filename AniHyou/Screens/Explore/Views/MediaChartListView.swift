//
//  MediaChartListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import SwiftUI
import AniListAPI

struct MediaChartListView: View {

    var title: String
    var type: MediaType
    var sort: MediaSort
    var status: MediaStatus?
    @StateObject private var viewModel = ExploreViewModel()

    var body: some View {
        List {
            ForEach(Array(viewModel.mediaChart.enumerated()), id: \.element?.id) { pos, item in
                if item != nil {
                    NavigationLink(destination: MediaDetailsView(mediaId: item!.id)) {
                        ChartListItemView(item: item!, position: pos+1)
                    }
                }
            }

            if viewModel.hasNextPageChart {
                ProgressView()
                    .onAppear {
                        viewModel.getMediaChart(type: type, sort: sort, status: status)
                    }
            }
        }
        .navigationTitle(title)
    }
}

struct MediaChartListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaChartListView(title: "Top 100 Anime", type: .anime, sort: .scoreDesc)
    }
}
