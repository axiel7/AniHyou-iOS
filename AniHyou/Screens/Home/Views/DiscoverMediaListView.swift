//
//  TrendingListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 05/06/2023.
//

import SwiftUI
import AniListAPI

struct DiscoverMediaListView: View {

    @ObservedObject var viewModel: DiscoverViewModel
    let mediaType: MediaType
    
    let media: [MediaSortedQuery.Data.Page.Medium]
    let hasNextPage: Bool
    let loadMore: () async -> Void
    
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15), alignment: .top)
    ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridColumns) {
                ForEach(media, id: \.id) { media in
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
                            await loadMore()
                        }
                }
            }//:LazyVGrid
        }//:VScrollView
    }
}

#Preview {
    DiscoverMediaListView(
        viewModel: DiscoverViewModel(),
        mediaType: .anime,
        media: [],
        hasNextPage: false,
        loadMore: {}
    )
}
