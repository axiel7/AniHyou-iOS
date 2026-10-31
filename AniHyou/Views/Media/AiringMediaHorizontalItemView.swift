//
//  AiringMediaHorizontalItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 03/07/2023.
//

import SwiftUI
import AniListAPI

struct AiringMediaHorizontalItemView: View {

    static let coverWidth: CGFloat = 94
    static let coverHeight: CGFloat = 130

    var title: String?
    var imageUrl: String?
    var score: Int?
    var nextEpisode: Int?
    var airingAt: Int?
    var status: MediaListStatus?
    var blurCover = false
    
    var scoreColor: Color {
        ScoreFormat.point100.color(score: score)
    }
    
    @AppStorage(HIDE_SCORES) private var hideScores = false

    var body: some View {
        HStack {
            ZStack(alignment: .bottomTrailing) {
                MediaCoverView(
                    imageUrl: imageUrl,
                    width: HListItemWithSubtitleView.coverWidth,
                    height: HListItemWithSubtitleView.coverHeight,
                    blurEnabled: blurCover
                )
                if let status {
                    Image(systemName: status.systemImage)
                        .padding(4)
                        .background(.thinMaterial, in: .circle)
                        .padding(4)
                }
            }
            .padding(.trailing, 8)

            VStack(alignment: .leading) {
                Text(title ?? "")
                    .font(.system(size: 16))
                    .foregroundStyle(.primary)
                    .padding(.bottom, 1)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                if let nextEpisode, let airingAt {
                    AiringText(
                        episode: nextEpisode,
                        airingAt: airingAt,
                        behindColor: .secondary,
                        airingColor: .secondary
                    )
                    .font(.subheadline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                }

                if let score, !hideScores {
                    HStack(alignment: .bottom, spacing: 4) {
                        Image(systemName: "star.fill")
                        Text("\(score)%")
                    }
                    .padding(.vertical, 1)
                    .font(.footnote)
                    .foregroundStyle(scoreColor)
                }
            }
        }//:HStack
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AiringMediaHorizontalItemView(
        title: "Cowboy Bebop: Tengoku no Tobira and a large title",
        imageUrl: "https://picsum.photos/300/200",
        score: 78,
        nextEpisode: 2,
        airingAt: 102839281
    )
    .frame(width: 280, alignment: .leading)
    .padding(.leading, 8)
}
