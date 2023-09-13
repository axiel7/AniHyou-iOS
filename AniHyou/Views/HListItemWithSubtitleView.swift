//
//  ListItemHorizontalView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

struct HListItemWithSubtitleView: View {

    static let coverWidth: CGFloat = 94
    static let coverHeight: CGFloat = 130

    var title: String?
    var subtitle: String?
    var imageUrl: String?
    var meanScore: Int?

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
                Text(subtitle ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                if let meanScore {
                    HStack(alignment: .bottom, spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Text("\(meanScore)%")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 1)
                }
            }
        }//:HStack
    }
}

#Preview {
    HListItemWithSubtitleView(
        title: "Cowboy Bebop: Tengoku no Tobira and a large title",
        subtitle: "Airing in 59 min",
        imageUrl: "https://picsum.photos/300/200",
        meanScore: 78
    )
    .frame(width: 280, alignment: .leading)
    .padding(.leading, 8)
    .previewLayout(.sizeThatFits)
}
