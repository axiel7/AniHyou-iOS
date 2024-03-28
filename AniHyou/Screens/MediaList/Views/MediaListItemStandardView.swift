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

                Spacer()

                if let schedule = item?.media?.nextAiringEpisode {
                    AiringText(
                        episode: schedule.episode,
                        airingAt: schedule.airingAt,
                        episodesBehind: (schedule.episode - 1) - (item?.progress ?? 0),
                        behindColor: .accentColor,
                        airingColor: .gray
                    )
                    .font(.subheadline)
                    .lineLimit(1)
                    .padding(.bottom, 1)
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

                ProgressView(value: Float(item?.progress ?? 0), total: Float(item?.totalProgress ?? Int.max))
            }
        }
        .frame(height: coverHeight)
    }
}

#Preview {
    NavigationStack {
        List(0...5, id: \.self) { _ in
            NavigationLink(destination: {}, label: {
                MediaListItemStandardView(item: nil)
            })
        }
    }
}
