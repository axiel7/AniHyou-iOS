//
//  StaffStatsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 28/03/2024.
//

import SwiftUI
import AniListAPI

struct StaffStatsView: View {
    
    let userId: Int
    let mediaType: MediaType
    @StateObject private var viewModel = StaffStatsViewModel()
    
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
                    ForEach(Array(viewModel.staff.enumerated()), id: \.element.staff?.id) { index, stat in
                        if let staff = stat.staff {
                            NavigationLink(destination: StaffDetailsView(staffId: staff.id)) {
                                PositionalStatItemView(
                                    name: staff.name?.userPreferred ?? "",
                                    position: index + 1,
                                    count: stat.count,
                                    meanScore: stat.meanScore,
                                    minutesWatched: stat.minutesWatched,
                                    chaptersRead: stat.chaptersRead,
                                    imageUrl: staff.image?.medium
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
            await viewModel.getStaffStats(userId: userId, mediaType: mediaType)
        }
        .onChange(of: viewModel.distribution) { _ in
            Task {
                await viewModel.getStaffStats(userId: userId, mediaType: mediaType)
            }
        }
    }
}

#Preview {
    StaffStatsView(userId: 208863, mediaType: .anime)
}
