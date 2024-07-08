//
//  CurrentView.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/07/2024.
//

import SwiftUI
import AniListAPI

struct CurrentView: View {
    
    @StateObject private var viewModel = CurrentViewModel()
    
    private let gridRows = [
        GridItem(.fixed(CurrentListItemView.height), spacing: 16),
        GridItem(.fixed(CurrentListItemView.height))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    list(mediaType: .anime)
                    
                    list(mediaType: .manga)
                }
                .padding(.top, 12)
            }
        }
    }
    
    @ViewBuilder
    func list(mediaType: MediaType) -> some View {
        HStack(alignment: .center) {
            Text(mediaType.currentListStatus)
                .font(.title2)
                .bold()
            Spacer()
            //TODO: See All button
        }
        .padding(.horizontal)
        .padding(.top, 8)
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridRows, spacing: 16) {
                let items = mediaType == .anime ? viewModel.animeList : viewModel.mangaList
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
                                    await viewModel.updateEntryProgress(of: item)
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
        .task {
            await viewModel.getMediaList(mediaType: mediaType)
        }
    }
}

#Preview {
    CurrentView()
}
