//
//  ChartListItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import SwiftUI
import AniListAPI

private let coverWidth: CGFloat = 73
private let coverHeight: CGFloat = 110

struct ChartListItemView: View {

    let item: MediaChartQuery.Data.Page.Medium
    let position: Int

    var body: some View {
        HStack(alignment: .center) {
            ZStack(alignment: .bottomTrailing) {
                MediaCoverView(
                    imageUrl: item.coverImage?.large,
                    width: coverWidth,
                    height: coverHeight
                )
                if let status = item.mediaListEntry?.status?.value {
                    Image(systemName: status.systemImage)
                        .padding(4)
                        .background(.thinMaterial, in: .circle)
                        .padding(4)
                }
            }

            Text(position.stringValue)
                .font(.title3)
                .bold()
                .foregroundStyle(.gray)
                .padding(.leading, 8)
                .padding(.trailing, 8)

            VStack(alignment: .leading) {
                Text(item.title?.userPreferred ?? "")
                    .font(.body)
                    .foregroundStyle(.primary)
                    .padding(.bottom, 2)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                Group {
                    Text(item.format?.value?.localizedName ?? "Unknown") +
                    Text(" · ") +
                    Text(item.startDate?.year?.stringValue ?? "")
                }
                .font(.subheadline)
                .foregroundStyle(.gray)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}

#Preview {
    ChartListItemView(item: .init(_fieldData: nil), position: 100)
}
