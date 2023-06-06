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
    var mediaId: Int
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            if viewModel.isLoading {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
            //MARK: - Rankings
            if !viewModel.rankings.isEmpty {
                Group {
                    Text("Rankings")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    rankingList
                }
            }
            
            //MARK: - Stats
            Group {
                Text("Status distribution")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                HorizontalBarStatsView(stats: viewModel.statusDistribution)
                
                Text("Score distribution")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                VerticalBarsStatsView(stats: viewModel.scoreDistribution)
            }
        }
        .padding(.bottom)
        .onAppear {
            viewModel.getMediaStats(mediaId: mediaId)
        }
    }
    
    var rankingList: some View {
        VStack(alignment: .center) {
            ForEach(viewModel.rankings, id: \.?.id) {
                if let ranking = $0 {
                    HStack {
                        Image(systemName: ranking.type.value?.systemImage ?? "star")
                            .foregroundColor(ranking.type.value?.color ?? nil)
                        Spacer()
                        Text("#\(ranking.rank)")
                        Text(ranking.context.firstCapitalized)
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
            }
            .padding(.horizontal)
        }
    }
}

struct MediaStatsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaStatsView(mediaId: 98478)
    }
}
