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
    var meanScore: Int?
    var nextEpisode: Int?
    var airingAt: Int?
    var status: MediaListStatus?

    var body: some View {
        HStack {
            ZStack(alignment: .bottomTrailing) {
                MediaCoverView(
                    imageUrl: imageUrl,
                    width: HListItemWithSubtitleView.coverWidth,
                    height: HListItemWithSubtitleView.coverHeight
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
                        behindColor: .gray,
                        airingColor: .gray
                    )
                    .font(.subheadline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                }

                if let meanScore {
                    HStack(alignment: .bottom, spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                        Text("\(meanScore)%")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical, 1)
                }
            }
        }//:HStack
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AiringMediaHorizontalItemView(
        title: "Cowboy Bebop: Tengoku no Tobira and a large title",
        imageUrl: "https://picsum.photos/300/200",
        meanScore: 78,
        nextEpisode: 2,
        airingAt: 102839281
    )
    .frame(width: 280, alignment: .leading)
    .padding(.leading, 8)
}
