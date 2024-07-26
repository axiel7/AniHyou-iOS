//
//  CurrentListItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/07/2024.
//

import SwiftUI
import AniListAPI

struct CurrentListItemView: View {
    
    static let height: CGFloat = 120
    static let width: CGFloat = 300
    
    let details: BasicMediaDetails?
    let entry: BasicMediaListEntry?
    let schedule: AiringEpisode?
    let onClickPlus: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            MediaCoverView(
                imageUrl: details?.coverImage?.large,
                width: 77,
                height: 115
            )

            VStack(alignment: .leading) {

                Text(details?.title?.userPreferred ?? "Error loading item")
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)

                if let schedule {
                    AiringText(
                        episode: schedule.episode,
                        airingAt: schedule.airingAt,
                        episodesBehind: (schedule.episode - 1) - (entry?.progress ?? 0),
                        behindColor: .accentColor,
                        airingColor: .gray
                    )
                    .font(.subheadline)
                }
                Spacer()
                
                Button(action: onClickPlus) {
                    if details?.type?.value == .anime {
                        Label("Ep", systemImage: "plus")
                    } else {
                        Label(entry?.isVolumeProgress == true ? "Vol" : "Ch",
                              systemImage: "plus"
                        )
                    }
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .controlSize(.small)

                HStack {
                    if let maxProgress = details?.maxProgress(
                        isVolume: entry?.isVolumeProgress == true
                    ) {
                        Text("\(entry?.progressPreferred ?? 0)/\(maxProgress)")
                    } else {
                        Text("\(entry?.progressPreferred ?? 0)")
                    }
                    Spacer()
                    if let score = entry?.score, score > 0 {
                        MediaListScoreIndicator(score: score)
                    }
                }
            }//:VStack
        }//:HStack
        .frame(
            width: CurrentListItemView.width,
            height: CurrentListItemView.height
        )
    }
}

#Preview {
    CurrentListItemView(
        details: nil,
        entry: nil,
        schedule: nil,
        onClickPlus: {}
    )
    .padding(8)
}
