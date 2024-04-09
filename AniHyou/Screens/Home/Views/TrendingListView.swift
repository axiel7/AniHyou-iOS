//
//  TrendingListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 05/06/2023.
//

import SwiftUI
import AniListAPI

struct TrendingListView: View {

    @ObservedObject var viewModel: DiscoverViewModel
    let mediaType: MediaType
    
    let trendingMedia: [MediaSortedQuery.Data.Page.Medium]
    let page: Int
    let hasNextPage: Bool
    
    init(viewModel: DiscoverViewModel, mediaType: MediaType) {
        self.viewModel = viewModel
        self.mediaType = mediaType
        self.trendingMedia = switch mediaType {
        case .anime:
            viewModel.trendingAnimes
        case .manga:
            viewModel.trendingManga
        }
        self.page = switch mediaType {
        case .anime:
            viewModel.pageTrendingAnime
        case .manga:
            viewModel.pageTrendingManga
        }
        self.hasNextPage = switch mediaType {
        case .anime:
            viewModel.hasNextPageTrendingAnime
        case .manga:
            viewModel.hasNextPageTrendingManga
        }
    }
    
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15), alignment: .top)
    ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridColumns) {
                ForEach(trendingMedia, id: \.id) { media in
                    NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                        VListItemView(
                            title: media.title?.userPreferred ?? "",
                            imageUrl: media.coverImage?.large,
                            meanScore: media.meanScore,
                            status: media.mediaListEntry?.status?.value
                        )
                        .mediaContextMenu(
                            mediaId: media.id,
                            mediaType: mediaType,
                            mediaListStatus: media.mediaListEntry?.status?.value
                        )
                    }
                    .buttonStyle(.plain)
                }
                if hasNextPage {
                    ProgressView()
                        .task {
                            switch mediaType {
                            case .anime:
                                await viewModel.getTrendingAnimes(page: page)
                            case .manga:
                                await viewModel.getTrendingManga(page: page)
                            }
                        }
                }
            }//:LazyVGrid
        }//:VScrollView
        .navigationTitle(mediaType == .anime ? "Trending Anime" : "Trending Manga")
    }
}

#Preview {
    TrendingListView(viewModel: DiscoverViewModel(), mediaType: .anime)
}
