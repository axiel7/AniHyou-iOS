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

    let item: UserMediaListQuery.Data.Page.MediaList?
    var showStatus: Bool = false

    var body: some View {
        HStack(spacing: 10) {
            ZStack(alignment: .bottomTrailing) {
                MediaCoverView(
                    imageUrl: item?.media?.coverImage?.large,
                    width: coverWidth,
                    height: coverHeight,
                    cancelOnDisappear: false
                )
                if showStatus, let status = item?.status?.value {
                    Image(systemName: status.systemImage)
                        .padding(4)
                        .background(.thinMaterial, in: .circle)
                        .padding(4)
                }
            }

            VStack(alignment: .leading) {

                Text(item?.media?.title?.userPreferred ?? "Error loading item")
                    .lineLimit(2)

                if let schedule = item?.media?.nextAiringEpisode {
                    AiringText(
                        episode: schedule.episode,
                        airingAt: schedule.airingAt,
                        episodesBehind: (schedule.episode - 1) - (item?.progress ?? 0),
                        behindColor: .accentColor,
                        airingColor: .gray
                    )
                    .font(.subheadline)
                    .padding(.top, 1)
                } else {
                    Spacer()
                }

                HStack {
                    Text("\(item?.progress ?? 0)/\(item?.totalProgress ?? 0)")
                    Spacer()
                    if let repeatCount = item?.repeat, repeatCount > 0 {
                        Image(systemName: "arrow.clockwise")
                            .foregroundStyle(.gray)
                    }
                    if item?.notes?.isEmpty == false {
                        Image(systemName: "note.text")
                            .foregroundStyle(.gray)
                    }
                    MediaListScoreIndicator(score: item?.score ?? 0)
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
                MediaListItemCompactView(item: nil)
            })
        }
    }
}
