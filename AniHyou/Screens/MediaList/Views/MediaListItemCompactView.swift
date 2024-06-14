//
//  MediaListItemCompactView.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/01/2023.
//

import SwiftUI
import AniListAPI

private let coverWidth: CGFloat = 70
private let coverHeight: CGFloat = 70

struct MediaListItemCompactView: View {

    let details: BasicMediaDetails?
    let entry: BasicMediaListEntry?
    let schedule: AiringEpisode?
    var showStatus: Bool = false

    var body: some View {
        HStack(spacing: 10) {
            ZStack(alignment: .bottomTrailing) {
                MediaCoverView(
                    imageUrl: details?.coverImage?.large,
                    width: coverWidth,
                    height: coverHeight
                )
                if showStatus, let status = entry?.status?.value {
                    Image(systemName: status.systemImage)
                        .padding(4)
                        .background(.thinMaterial, in: .circle)
                        .padding(4)
                }
            }

            VStack(alignment: .leading) {

                Text(details?.title?.userPreferred ?? "Error loading item")
                    .lineLimit(2)

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

                HStack {
                    if let maxProgress = details?.maxProgress(
                        isVolume: entry?.isVolumeProgress == true
                    ) {
                        Text("\(entry?.progressPreferred ?? 0)/\(maxProgress)")
                    } else {
                        Text("\(entry?.progressPreferred ?? 0)")
                    }
                    Spacer()
                    if let repeatCount = entry?.repeat, repeatCount > 0 {
                        Image(systemName: "arrow.clockwise")
                            .foregroundStyle(.gray)
                    }
                    if entry?.notes?.isEmpty == false {
                        Image(systemName: "note.text")
                            .foregroundStyle(.gray)
                    }
                    if let score = entry?.score, score > 0 {
                        MediaListScoreIndicator(score: score)
                    }
                }
            }//:VStack
        }//:HStack
        .padding(.vertical, 4)
    }
}

#Preview {
    NavigationStack {
        List(0...4, id: \.self) { _ in
            NavigationLink(destination: {}, label: {
                MediaListItemCompactView(details: nil, entry: nil, schedule: nil)
            })
        }
    }
}
