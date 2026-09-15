//
//  StudioDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 03/01/2023.
//

import SwiftUI
import AniListAPI

struct StudioDetailsView: View {

    let studioId: Int
    @State private var viewModel = StudioDetailsViewModel()
    @AppStorage(BLUR_ADULT_MEDIA) private var blurAdultMedia = true
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
                                        status: item.mediaListEntry?.status?.value,
                                        blurCover: blurAdultMedia && item.isAdult == true
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
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        Task { await viewModel.toggleFavorite() }
                    } label: {
                        Text((studio.favourites ?? 0).formatted())
                        Image(systemName: studio.isFavourite ? "heart.fill" : "heart")
                    }
                    .tint(nil)
                    
                    Menu("Filter", systemImage: "line.3.horizontal.decrease") {
                        Button {
                            if viewModel.onMyList == nil {
                                viewModel.onMyList = true
                            } else {
                                viewModel.onMyList = nil
                            }
                        } label: {
                            if viewModel.onMyList == true {
                                Label("On my list", systemImage: "checkmark")
                            } else {
                                Text("On my list")
                            }
                        }
                        .onChange(of: viewModel.onMyList) {
                            Task { await viewModel.refresh() }
                        }
                        
                        Picker("Sort", selection: $viewModel.sort) {
                            ForEach(MediaSort.allCasesStudio, id: \.self) {
                                Text($0.localizedName).tag($0)
                            }
                        }
                        .onChange(of: viewModel.sort) {
                            Task { await viewModel.refresh() }
                        }
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
