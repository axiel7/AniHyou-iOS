//
//  VoiceActorsStatsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import SwiftUI

struct VoiceActorsStatsView: View {
    
    let userId: Int
    @StateObject private var viewModel = VoiceActorsStatsViewModel()
    
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
                    ForEach(Array(viewModel.voiceActors.enumerated()), id: \.element.voiceActor?.id) { index, stat in
                        if let voiceActor = stat.voiceActor {
                            NavigationLink(destination: StaffDetailsView(staffId: voiceActor.id)) {
                                PositionalStatItemView(
                                    name: voiceActor.name?.userPreferred ?? "",
                                    position: index + 1,
                                    count: stat.count,
                                    meanScore: stat.meanScore,
                                    minutesWatched: stat.minutesWatched,
                                    chaptersRead: stat.chaptersRead,
                                    imageUrl: voiceActor.image?.medium
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
            await viewModel.getVoiceActorsStats(userId: userId)
        }
        .onChange(of: viewModel.distribution) {
            Task {
                await viewModel.getVoiceActorsStats(userId: userId)
            }
        }
    }
}

#Preview {
    VoiceActorsStatsView(userId: 208863)
}
