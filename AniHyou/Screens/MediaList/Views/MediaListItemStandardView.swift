//
//  MediaListItem.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import AniListAPI

private let coverWidth: CGFloat = 77
private let coverHeight: CGFloat = 115

struct MediaListItemStandardView: View {

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

                Spacer()

                if let schedule {
                    AiringText(
                        episode: schedule.episode,
                        airingAt: schedule.airingAt,
                        episodesBehind: (schedule.episode - 1) - (entry?.progress ?? 0),
                        behindColor: .accentColor,
                        airingColor: .gray
                    )
                    .font(.subheadline)
                    .padding(.bottom, 1)
                }

                let maxProgress = details?.maxProgress(
                    isVolume: entry?.isVolumeProgress == true
                )
                HStack {
                    if let maxProgress {
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

                ProgressView(
                    value: Float(entry?.progressPreferred ?? 0),
                    total: Float(maxProgress ?? Int.max)
                )
            }
        }
        .frame(height: coverHeight)
    }
}

#Preview {
    NavigationStack {
        List(0...5, id: \.self) { _ in
            NavigationLink(destination: {}, label: {
                MediaListItemStandardView(details: nil, entry: nil, schedule: nil)
            })
        }
    }
}
