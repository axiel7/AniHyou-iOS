//
//  StudiosStatsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import SwiftUI

struct StudiosStatsView: View {
    
    let userId: Int
    @StateObject private var viewModel = StudiosStatsViewModel()
    
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
                    ForEach(Array(viewModel.studios.enumerated()), id: \.element.studio?.id) { index, stat in
                        if let studio = stat.studio {
                            NavigationLink(destination: StudioDetailsView(studioId: studio.id)) {
                                PositionalStatItemView(
                                    name: studio.name,
                                    position: index + 1,
                                    count: stat.count,
                                    meanScore: stat.meanScore,
                                    minutesWatched: stat.minutesWatched,
                                    chaptersRead: stat.chaptersRead
                                )
                                .padding()
                            }
                            .buttonStyle(.plain)
                            Divider()
                        }
                    }
                }
            }
        }//:VStack
        .frame(minHeight: 500)
        .task {
            await viewModel.getStudiosStats(userId: userId)
        }
        .onChange(of: viewModel.distribution) { _ in
            Task {
                await viewModel.getStudiosStats(userId: userId)
            }
        }
    }
}

#Preview {
    StudiosStatsView(userId: 208863)
}
