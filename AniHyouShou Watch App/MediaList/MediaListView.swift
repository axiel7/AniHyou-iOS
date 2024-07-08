//
//  MediaListView.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 12/01/2023.
//

import SwiftUI
import AniListAPI

struct MediaListView: View {

    let type: MediaType
    @StateObject private var viewModel = MediaListViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.mediaList, id: \.uniqueListId) { entry in
                    NavigationLink(destination: UpdateMediaEntryView(entry: entry, viewModel: viewModel)) {
                        MediaListItemStandardView(item: entry)
                    }
                    .listItemTint(entry.coverColorWithAlpha)
                }

                if viewModel.isLoading || viewModel.hasNextPage {
                    ProgressView()
                        .task {
                            if viewModel.hasNextPage {
                                await viewModel.getUserMediaList()
                            }
                        }
                }
            }
            .navigationTitle(type.localizedName)
        }
        .task {
            viewModel.mediaType = type
            await viewModel.getUserMediaList()
        }
    }
}

struct MediaListItemStandardView: View {

    let item: ShouUserMediaList

    var body: some View {
        HStack {
            Text(item.media?.title?.userPreferred ?? "")
                .lineLimit(2)
            Spacer()
            Text("\(item.progress ?? 0)/\(item.maxProgress)")
        }
    }
}

#Preview {
    MediaListView(type: .anime)
}
