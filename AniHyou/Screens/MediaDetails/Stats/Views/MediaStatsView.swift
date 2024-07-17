//
//  MediaStatsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/01/2023.
//

import SwiftUI
import AniListAPI

struct MediaStatsView: View {

    @StateObject private var viewModel = MediaStatsViewModel()
    let mediaId: Int

    var body: some View {
        LazyVStack(alignment: .leading) {
            if viewModel.isLoading {
                HorizontalProgressView()
            }
            // MARK: - Rankings
            if !viewModel.rankings.isEmpty {
                Group {
                    title("Rankings")
                    rankingList
                }
            }
            // MARK: - Stats
            title("Status distribution")
                .padding(.top)
            HorizontalBarStatsView(stats: viewModel.statusDistribution)

            title("Score distribution")
                .padding(.top)
            VerticalBarsStatsView(stats: viewModel.scoreDistribution)
            
            // MARK: - Social
            title("Following")
                .padding(.top)
            followingList
        }
        .padding(.bottom)
        .task {
            await viewModel.fetchData(mediaId: mediaId)
        }
    }
    
    func title(_ text: LocalizedStringKey) -> some View {
        Text(text)
            .font(.title3)
            .bold()
            .padding(.horizontal)
    }

    var rankingList: some View {
        VStack(alignment: .center) {
            ForEach(viewModel.rankings, id: \.id) { ranking in
                HStack {
                    Image(systemName: ranking.type.value?.systemImage ?? "star")
                        .foregroundStyle(ranking.type.value?.color ?? .primary)
                    Spacer()
                    Text("#\(ranking.rank)")
                    if let type = ranking.type.value {
                        Text(type.localizedContext)
                    } else {
                        Text(ranking.context.firstCapitalized)
                    }
                    if let season = ranking.season?.value {
                        Text(season.localizedName)
                    }
                    if let year = ranking.year {
                        Text(String(year))
                    }
                    Spacer()
                }
                .padding(8)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            .padding(.horizontal)
        }
    }
    
    var followingList: some View {
        VStack {
            ForEach(viewModel.following, id: \.id) { entry in
                NavigationLink(destination: ProfileView(userId: entry.user?.id)) {
                    HStack {
                        CircleImageView(imageUrl: entry.user?.avatar?.medium, size: 32)
                        Text(entry.user?.name ?? "")
                            .padding(.horizontal, 8)
                        Spacer()
                        if let score = entry.score, score > 0,
                           let scoreFormat = entry.user?.mediaListOptions?.scoreFormat?.value {
                            MediaListScoreIndicator(score: score)
                                .environment(\.scoreFormat, scoreFormat)
                        }
                        if let status = entry.status?.value {
                            Image(systemName: status.systemImage)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    MediaStatsView(mediaId: 98478)
}
