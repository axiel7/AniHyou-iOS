//
//  CurrentView.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/07/2024.
//

import SwiftUI
import AniListAPI

struct CurrentView: View {
    
    @State private var viewModel = CurrentViewModel()
    @AppStorage(BLUR_ADULT_MEDIA) private var blurAdultMedia = true
    
    private let oneGirdRow = [GridItem(.fixed(CurrentListItemView.height))]
    private let twoGridRows = [
        GridItem(.fixed(CurrentListItemView.height), spacing: 16),
        GridItem(.fixed(CurrentListItemView.height))
    ]
    
    var body: some View {
        VStack {
            ForEach(CurrentListType.allCases, id: \.self) { type in
                let items = switch type {
                case .airing:
                    viewModel.airingList
                case .behind:
                    viewModel.behindList
                case .anime:
                    viewModel.animeList
                case .manga:
                    viewModel.mangaList
                case .nextSeason:
                    viewModel.nextSeasonList
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
        .padding(.bottom, 8)
        .refreshable {
            await viewModel.fetchLists(refresh: true)
        }
        .onAppear {
            Task {
                await viewModel.fetchLists()
            }
        }
    }
    
    @ViewBuilder
    func list(
        type: CurrentListType,
        items: [CommonMediaListEntry]
    ) -> some View {
        let rowsCount: CGFloat = items.count == 1 ? 1 : 2
        let rows = rowsCount == 1 ? oneGirdRow : twoGridRows
        
        ListHeader(type.title) {
            ExpandedCurrentListView(
                type: type,
                items: items,
                onClickPlus: { item in
                    Task {
                        await viewModel.updateEntryProgress(of: item, type: type)
                    }
                },
                blurAdultMedia: blurAdultMedia
            )
        }
        
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
                            },
                            blurCover: blurAdultMedia && item.media?.isAdult == true
                        )
                        .frame(
                            width: CurrentListItemView.width,
                            height: CurrentListItemView.height
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
