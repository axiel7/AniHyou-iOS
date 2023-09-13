//
//  MediaListView.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 12/01/2023.
//

import SwiftUI
import AniListAPI

struct MediaListView: View {

    var type: MediaType
    @State var status: MediaListStatus = .current
    @StateObject private var viewModel = MediaListViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.mediaList, id: \.?.id) {
                    if let entry = $0 {
                        NavigationLink(destination: UpdateMediaEntryView(entry: entry, viewModel: viewModel)) {
                            MediaListItemStandardView(item: entry)
                        }
                        .listItemTint(entry.coverColorWithAlpha)
                    }
                }

                if viewModel.hasNextPage {
                    ProgressView()
                        .onAppear {
                            viewModel.getUserMediaList(otherUserId: nil)
                        }
                }
            }
            .navigationTitle(type == .anime ? "Anime" : "Manga")
        }
        .onAppear {
            viewModel.mediaType = type
            viewModel.mediaListStatus = status
        }
    }
}

struct MediaListItemStandardView: View {

    var item: UserMediaListQuery.Data.Page.MediaList

    var body: some View {
        HStack {
            Text(item.media?.title?.userPreferred ?? "")
                .lineLimit(2)
            Spacer()
            Text("\(item.progress ?? 0)/\(item.totalProgress ?? 0)")
        }
    }
}

#Preview {
    MediaListView(type: .anime)
}
