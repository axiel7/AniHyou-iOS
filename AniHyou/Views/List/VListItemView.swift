//
//  VListItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI
import AniListAPI

struct VListItemView: View {
    static let coverWidth: CGFloat = 90
    static let coverHeight: CGFloat = 130

    let title: String
    let imageUrl: String?
    var meanScore: Int?
    var nextEpisode: Int?
    var airingAt: Int?
    var status: MediaListStatus?
    var isAdult: Bool?

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomTrailing) {
                MediaCoverView(
                    imageUrl: imageUrl,
                    width: VListItemView.coverWidth,
                    height: VListItemView.coverHeight,
                    blurEnabled: isAdult == true
                )
                if let status {
                    Image(systemName: status.systemImage)
                        .padding(4)
                        .background(.thinMaterial, in: .circle)
                        .padding(4)
                }
            }
            .padding(.top, 4)

            Text(title)
                .font(.system(size: 15))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.primary)
                .padding(.bottom, 1)
                .frame(width: VListItemView.coverWidth, alignment: .leading)

            Group {
                if let meanScore {
                    HStack(alignment: .bottom, spacing: 4) {
                        Image(systemName: "star.fill")
                        Text("\(meanScore)%")
                    }
                    .padding(.bottom, 1)
                }
                if let nextEpisode, let airingAt {
                    let time = Date(timeIntervalSince1970: Double(airingAt))
                    Text("Ep \(nextEpisode) at \(time, format: .dateTime.hour().minute())")
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 1)
                        .frame(width: VListItemView.coverWidth, alignment: .leading)
                }
            }
            .font(.footnote)
            .foregroundStyle(.gray)
        }
        .frame(minHeight: VListItemView.coverHeight + 54, alignment: .top)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LazyHStack(alignment: .top) {
        VListItemView(title: "Kimetsu no Yaiba: Katana", imageUrl: "", meanScore: 78)
        VListItemView(title: "One Piece", imageUrl: "", isAdult: true)
        VListItemView(title: "One Piece", imageUrl: "", nextEpisode: 123, airingAt: 1228328)
    }
}
