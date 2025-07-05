//
//  CurrentView.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/07/2024.
//

import SwiftUI
import AniListAPI

struct CurrentView: View {
    
    enum ListType: CaseIterable {
        case airing
        case behind
        case anime
        case manga
        
        var title: LocalizedStringKey {
            switch self {
            case .airing:
                "Airing"
            case .behind:
                "Anime Behind"
            case .anime:
                "Watching"
            case .manga:
                "Reading"
            }
        }
    }
    
    @StateObject private var viewModel = CurrentViewModel()
    
    private let oneGirdRow = [GridItem(.fixed(CurrentListItemView.height))]
    private let twoGridRows = [
        GridItem(.fixed(CurrentListItemView.height), spacing: 16),
        GridItem(.fixed(CurrentListItemView.height))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(ListType.allCases, id: \.self) { type in
                        let items = switch type {
                        case .airing:
                            viewModel.airingList
                        case .behind:
                            viewModel.behindList
                        case .anime:
                            viewModel.animeList
                        case .manga:
                            viewModel.mangaList
                        }
                        if !items.isEmpty {
                            list(type: type, items: items)
                        }
                    }
                    
                    if viewModel.isLoading {
                        HorizontalProgressView()
                    }
                    
                    if viewModel.hasNothing {
                        HStack {
                            Spacer()
                            Text("Nothing in your list")
                            Spacer()
                        }
                    }
                }
                .padding(.top, 12)
                .padding(.bottom, 8)
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
        let rowsCount: CGFloat = items.count == 1 ? 1 : 2
        let rows = rowsCount == 1 ? oneGirdRow : twoGridRows
        
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
            LazyHGrid(rows: rows, spacing: 16) {
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
            .scrollTargetLayout()
            .frame(height: CurrentListItemView.height * rowsCount + 20)
            .padding(.leading)
        }
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
    }
}

#Preview {
    CurrentView()
}
