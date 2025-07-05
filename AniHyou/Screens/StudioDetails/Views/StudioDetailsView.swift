//
//  StudioDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 03/01/2023.
//

import SwiftUI

struct StudioDetailsView: View {

    let studioId: Int
    @StateObject private var viewModel = StudioDetailsViewModel()
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 20))
    ]

    var body: some View {
        if let studio = viewModel.studio {
            ScrollView(.vertical) {
                VStack {
                    if viewModel.studioMedia.isEmpty {
                        Text("No media")
                            .padding()
                    } else {
                        LazyVGrid(columns: gridColumns) {
                            ForEach(viewModel.studioMedia, id: \.id) { item in
                                NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                                    VListItemView(
                                        title: item.title?.userPreferred ?? "",
                                        imageUrl: item.coverImage?.large,
                                        status: item.mediaListEntry?.status?.value
                                    )
                                    .mediaContextMenu(
                                        mediaId: item.id,
                                        mediaType: item.type?.value,
                                        mediaListStatus: item.mediaListEntry?.status?.value
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                            
                            if viewModel.hasNextPage {
                                ProgressView()
                                    .task {
                                        await viewModel.getStudioMedia(studioId: studioId)
                                    }
                            }
                        }//:VGrid
                    }
                }//:VStack
            }//:VScrollView
            .navigationTitle(studio.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        Task {
                            await viewModel.toggleFavorite()
                        }
                    }) {
                        Text((studio.favourites ?? 0).formatted())
                        Image(systemName: studio.isFavourite ? "heart.fill" : "heart")
                    }
                    .tint(nil)
                }
            }
        } else {
            ProgressView()
                .task {
                    await viewModel.getStudioDetails(studioId: studioId)
                }
        }
    }
}

#Preview {
    StudioDetailsView(studioId: 1)
}
