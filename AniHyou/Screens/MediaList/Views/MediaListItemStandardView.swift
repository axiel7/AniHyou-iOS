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
    @AppStorage(USER_SCORE_KEY) var scoreFormat: String = ScoreFormat.point100.rawValue
    var scoreFormatEnum: ScoreFormat {
        return ScoreFormat(rawValue: scoreFormat) ?? .point100
    }

    var body: some View {
        HStack {
            MediaCoverView(
                imageUrl: item?.media?.coverImage?.large,
                width: coverWidth,
                height: coverHeight,
                cancelOnDisappear: false
            )

            VStack(alignment: .leading) {
                Text(item?.media?.title?.userPreferred ?? "Error loading item")
                    .lineLimit(2)

                Spacer()

                if item?.media?.nextAiringEpisode != nil {
                    AiringScheduleItemText(item: item)
                }

                HStack {
                    Text("\(item?.progress ?? 0)/\(item?.totalProgress ?? 0)")
                    Spacer()
                    if item?.repeat != nil && item!.repeat! > 0 {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.gray)
                    }
                    if item?.notes?.isEmpty == false {
                        Image(systemName: "note.text")
                            .foregroundColor(.gray)
                    }
                    MediaListScoreIndicator(score: item?.score ?? 0, format: scoreFormatEnum)
                }

                ProgressView(value: Float(item?.progress ?? 0), total: Float(item?.totalProgress ?? Int.max))
            }
        }
        .frame(height: coverHeight)
    }
}

struct AiringScheduleItemText: View {

    let item: UserMediaListQuery.Data.Page.MediaList?
    @AppStorage(ACCENT_COLOR_KEY) private var accentColor = ANIHYOU_COLOR

    var body: some View {
        let airing = item!.media!.nextAiringEpisode!
        let isBehind = item?.progress ?? 0 < airing.episode - 1
        HStack(spacing: 1) {
            Text(isBehind ? "^[\((airing.episode - 1) - (item?.progress ?? 0)) episodes](inflect: true) behind"
                 : "Ep \(airing.episode) airing in "
            )
            .font(.subheadline)
            .lineLimit(1)

            if !isBehind {
                Text(Date(timeIntervalSince1970: Double(airing.airingAt)), style: .relative)
                    .font(.subheadline)
                    .lineLimit(1)
            }
        }
        .foregroundColor(isBehind ? Color(hex: accentColor) : .gray)
        .padding(.bottom, 1)
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
