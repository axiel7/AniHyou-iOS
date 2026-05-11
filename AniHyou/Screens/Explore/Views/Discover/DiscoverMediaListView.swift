//
//  TrendingListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 05/06/2023.
//

import SwiftUI
import AniListAPI

struct DiscoverMediaListView: View {

    var viewModel: DiscoverViewModel
    let mediaType: MediaType
    
    let media: [MediaSortedQuery.Data.Page.Medium]
    let hasNextPage: Bool
    let loadMore: () async -> Void
    
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15), alignment: .top)
    ]
    
    @AppStorage(BLUR_ADULT_MEDIA) private var blurAdultMedia = true

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridColumns) {
                ForEach(media, id: \.id) { media in
                    NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                        VListItemView(
                            title: media.title?.userPreferred ?? "",
                            imageUrl: media.coverImage?.large,
                            meanScore: media.meanScore,
                            status: media.mediaListEntry?.status?.value,
                            blurCover: blurAdultMedia && media.isAdult == true
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
