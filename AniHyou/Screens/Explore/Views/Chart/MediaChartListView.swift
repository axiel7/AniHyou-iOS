//
//  MediaChartListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import SwiftUI
import AniListAPI

struct MediaChartListView: View {

    let title: LocalizedStringKey
    let type: MediaType
    let sort: MediaSort
    var status: MediaStatus?
    var format: MediaFormat?
    @StateObject private var viewModel = ChartViewModel()

    var body: some View {
        List {
            ForEach(Array(viewModel.mediaChart.enumerated()), id: \.element.id) { pos, item in
                NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                    ChartListItemView(item: item, position: pos+1)
                }
            }

            if viewModel.hasNextPage {
                HorizontalProgressView()
                    .onAppear {
                        viewModel.getMediaChart(
                            type: type,
                            sort: sort,
                            status: status,
                            format: format
                        )
                    }
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    MediaChartListView(title: "Top 100 Anime", type: .anime, sort: .scoreDesc)
}
