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
    var country: CountryCode?
    @State private var viewModel = ChartViewModel()
    @AppStorage(BLUR_ADULT_MEDIA) private var blurAdultMedia = false

    var body: some View {
        List {
            ForEach(Array(viewModel.mediaChart.enumerated()), id: \.element.id) { pos, item in
                NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                    MediaItemHorizontal(
                        coverImage: item.coverImage?.large,
                        listStatus: item.mediaListEntry?.status?.value,
                        position: pos + 1,
                        title: item.title?.userPreferred ?? "",
                        mediaFormat: item.format?.value,
                        year: item.startDate?.year,
                        mediaStatus: item.status?.value,
                        meanScore: item.meanScore,
                        episodes: item.episodes,
                        chapters: item.chapters,
                        duration: item.duration,
                        genres: item.genres,
                        blurCover: blurAdultMedia && item.isAdult == true
                    )
                    .mediaContextMenu(
                        mediaId: item.id,
                        mediaType: item.type?.value,
                        mediaListStatus: item.mediaListEntry?.status?.value
                    )
                }
            }

            if viewModel.hasNextPage {
                HorizontalProgressView()
                    .task {
                        await viewModel.getMediaChart(
                            type: type,
                            sort: sort,
                            status: status,
                            format: format,
                            country: country
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
