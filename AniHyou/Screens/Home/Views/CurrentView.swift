//
//  CurrentView.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/07/2024.
//

import SwiftUI
import AniListAPI

struct CurrentView: View {
    
    enum ListType {
        case airing
        case anime
        case manga
        
        var title: LocalizedStringKey {
            switch self {
            case .airing:
                "Airing"
            case .anime:
                "Watching"
            case .manga:
                "Reading"
            }
        }
    }
    
    @StateObject private var viewModel = CurrentViewModel()
    
    private let gridRows = [
        GridItem(.fixed(CurrentListItemView.height), spacing: 16),
        GridItem(.fixed(CurrentListItemView.height))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    let hasAiring = !viewModel.airingList.isEmpty
                    if hasAiring {
                        list(type: .airing, items: viewModel.airingList)
                    }
                    
                    let hasAnime = !viewModel.animeList.isEmpty
                    if hasAnime {
                        list(type: .anime, items: viewModel.animeList)
                    }
                    
                    let hasManga = !viewModel.mangaList.isEmpty
                    if hasManga {
                        list(type: .manga, items: viewModel.mangaList)
                    }
                    
                    if viewModel.isLoading {
                        HorizontalProgressView()
                    }
                    
                    let hasNothing = !hasAiring && !hasAnime && !hasManga
                    if hasNothing {
                        HStack {
                            Spacer()
                            Text("Nothing in your list")
                            Spacer()
                        }
                    }
                }
                .padding(.top, 12)
            }
            .refreshable {
                await viewModel.fetchLists()
            }
            .task {
                await viewModel.fetchLists()
            }
        }
    }
    
    @ViewBuilder
    func list(
        type: ListType,
        items: [CommonMediaListEntry]
    ) -> some View {
        HStack(alignment: .center) {
            Text(type.title)
                .font(.title2)
                .bold()
            Spacer()
            //TODO: See All button
        }
        .padding(.horizontal)
        .padding(.top, 8)
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridRows, spacing: 16) {
                ForEach(items, id: \.uniqueListId) { item in
                    NavigationLink(
                        destination: MediaDetailsView(mediaId: item.mediaId)
                    ) {
                        CurrentListItemView(
                            details: item.media?.fragments.basicMediaDetails,
                            entry: item.fragments.basicMediaListEntry,
                            schedule: item.media?.nextAiringEpisode?.fragments.airingEpisode,
                            onClickPlus: {
                                Task {
                                    await viewModel.updateEntryProgress(of: item, type: type)
                                }
                            }
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .scrollTargetLayoutCompat()
            .frame(height: CurrentListItemView.height * 2 + 20)
            .padding(.leading)
        }
        .scrollTargetBehaviorCompat()
    }
}

#Preview {
    CurrentView()
}
