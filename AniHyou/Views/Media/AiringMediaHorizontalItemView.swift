//
//  AiringMediaHorizontalItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 03/07/2023.
//

import SwiftUI

struct AiringMediaHorizontalItemView: View {

    static let coverWidth: CGFloat = 94
    static let coverHeight: CGFloat = 130

    var title: String?
    var imageUrl: String?
    var meanScore: Int?
    var nextEpisode: Int?
    var airingAt: Int?

    var body: some View {
        HStack {
            MediaCoverView(
                imageUrl: imageUrl,
                width: HListItemWithSubtitleView.coverWidth,
                height: HListItemWithSubtitleView.coverHeight,
                cancelOnDisappear: true
            )
            .padding(.trailing, 8)

            VStack(alignment: .leading) {
                Text(title ?? "")
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
                    .padding(.bottom, 1)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                if nextEpisode != nil && airingAt != nil {
                    Group {
                        Text("Ep \(nextEpisode!) airing in ") +
                        Text(Date(timeIntervalSince1970: Double(airingAt!)), style: .relative)
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                }

                if meanScore != nil {
                    HStack(alignment: .bottom, spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Text("\(meanScore!)%")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 1)
                }
            }
        }//:HStack
    }
}

struct AiringMediaHorizontalItemView_Previews: PreviewProvider {
    static var previews: some View {
        AiringMediaHorizontalItemView(
            title: "Cowboy Bebop: Tengoku no Tobira and a large title",
            imageUrl: "https://picsum.photos/300/200",
            meanScore: 78,
            nextEpisode: 2,
            airingAt: 102839281
        )
        .frame(width: 280, alignment: .leading)
        .padding(.leading, 8)
        .previewLayout(.sizeThatFits)
    }
}
