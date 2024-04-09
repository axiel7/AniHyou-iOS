//
//  MediaListItemMinimalView.swift
//  AniHyou
//
//  Created by Axel Lopez on 14/01/2023.
//

import SwiftUI
import AniListAPI

struct MediaListItemMinimalView: View {

    let details: BasicMediaDetails?
    let entry: BasicMediaListEntry?
    let schedule: AiringEpisode?
    var showStatus: Bool = false

    var body: some View {
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
                .padding(.vertical, 1)
            } else {
                Spacer()
            }

            HStack {
                if showStatus, let status = entry?.status?.value {
                    Image(systemName: status.systemImage)
                        .foregroundStyle(.gray)
                }
                Text("\(entry?.progress ?? 0)/\(details?.maxProgress ?? 0)")
                Spacer()
                if let repeatCount = entry?.repeat, repeatCount > 0 {
                    Image(systemName: "arrow.clockwise")
                        .foregroundStyle(.gray)
                }
                if entry?.notes?.isEmpty == false {
                    Image(systemName: "note.text")
                        .foregroundStyle(.gray)
                }
                MediaListScoreIndicator(score: entry?.score ?? 0)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NavigationStack {
        List(0...4, id: \.self) { _ in
            NavigationLink(destination: {}, label: {
                MediaListItemMinimalView(details: nil, entry: nil, schedule: nil)
            })
        }
    }
}
