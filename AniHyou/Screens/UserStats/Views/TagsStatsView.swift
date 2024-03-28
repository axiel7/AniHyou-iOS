//
//  TagsStatsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import SwiftUI
import AniListAPI

struct TagsStatsView: View {
    
    let userId: Int
    let mediaType: MediaType
    @StateObject private var viewModel = TagsStatsViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.isLoading {
                HorizontalProgressView()
                Spacer()
            } else {
                Picker("Distribution type", selection: $viewModel.distribution) {
                    ForEach(StatDistributionType.allCases, id: \.self) {
                        Text($0.localizedName)
                    }
                }
                .padding(.horizontal, 4)
                
                LazyVStack {
                    ForEach(Array(viewModel.tags.enumerated()), id: \.element.tag?.id) { index, stat in
                        PositionalStatItemView(
                            name: stat.tag?.name ?? "",
                            position: index + 1,
                            count: stat.count,
                            meanScore: stat.meanScore,
                            minutesWatched: stat.minutesWatched,
                            chaptersRead: stat.chaptersRead
                        )
                        .padding()
                        Divider()
                    }
                }
            }
        }//:VStack
        .frame(minHeight: 500)
        .onAppear {
            viewModel.getTagsStats(userId: userId, mediaType: mediaType)
        }
        .onChange(of: viewModel.distribution) { _ in
            viewModel.getTagsStats(userId: userId, mediaType: mediaType)
        }
    }
}

#Preview {
    TagsStatsView(userId: 208863, mediaType: .anime)
}
