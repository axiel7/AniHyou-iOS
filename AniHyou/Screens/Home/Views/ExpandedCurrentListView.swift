//
//  ExpandedCurrentListView.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/10/25.
//

import SwiftUI
import AniListAPI

struct ExpandedCurrentListView: View {
    
    let type: CurrentListType
    let items: [CommonMediaListEntry]
    let onClickPlus: (CommonMediaListEntry) -> Void
    
    var body: some View {
        List(items, id: \.uniqueListId) { item in
            NavigationLink(
                destination: MediaDetailsView(mediaId: item.mediaId)
            ) {
                CurrentListItemView(
                    details: item.media?.fragments.basicMediaDetails,
                    entry: item.fragments.basicMediaListEntry,
                    schedule: item.media?.nextAiringEpisode?.fragments.airingEpisode,
                    onClickPlus: { onClickPlus(item) }
                )
                .frame(height: CurrentListItemView.height)
            }
            .buttonStyle(.plain)
        }
        .listStyle(.plain)
        .navigationTitle(type.title)
    }
}

#Preview {
    ExpandedCurrentListView(type: .airing, items: [], onClickPlus: { _ in })
}
