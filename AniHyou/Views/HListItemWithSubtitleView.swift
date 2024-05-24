//
//  ListItemHorizontalView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI
import AniListAPI

struct HListItemWithSubtitleView: View {

    static let coverWidth: CGFloat = 94
    static let coverHeight: CGFloat = 130

    var title: String?
    var subtitle: String?
    var subtitleLocalized: LocalizedStringKey?
    var subtitle2: String?
    var subtitle2Text: Text?
    var twoSubtitleTexts: (LocalizedStringKey?, LocalizedStringKey?)?
    var imageUrl: String?
    var meanScore: Int?
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
                Group {
                    if let subtitle {
                        Text(subtitle)
                    } else if let subtitleLocalized {
                        Text(subtitleLocalized)
                    } else if let twoSubtitleTexts {
                        Text(twoSubtitleTexts.0 ?? "Unknown") +
                        Text(" · ") +
                        Text(twoSubtitleTexts.1 ?? "Unknown")
                    } else {
                        Text("")
                    }
                }
                .font(.subheadline)
                .foregroundStyle(.gray)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                if let meanScore {
                    Label("\(meanScore)%", systemImage: "star.fill")
                        .foregroundStyle(ScoreFormat.point100.color(score: meanScore))
                        .font(.footnote)
                        .padding(.vertical, 1)
                }
                if let subtitle2 {
                    Text(subtitle2)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                } else if let subtitle2Text {
                    subtitle2Text
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
            }//:VStack
        }//:HStack
    }
}

#Preview {
    HListItemWithSubtitleView(
        title: "Cowboy Bebop: Tengoku no Tobira and a large title",
        subtitle: "Airing in 59 min",
        twoSubtitleTexts: ("Winter", "\(2020)"),
        imageUrl: "https://picsum.photos/300/200",
        meanScore: 78
    )
    .frame(width: 280, alignment: .leading)
    .padding(.leading, 8)
    .previewLayout(.sizeThatFits)
}
