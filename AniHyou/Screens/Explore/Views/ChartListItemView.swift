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

    var item: MediaChartQuery.Data.Page.Medium
    var position: Int

    var body: some View {
        HStack(alignment: .center) {
            MediaCoverView(
                imageUrl: item.coverImage?.large,
                width: coverWidth,
                height: coverHeight,
                cancelOnDisappear: true
            )

            Text(position.stringValue)
                .font(.title3)
                .bold()
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.trailing, 8)

            VStack(alignment: .leading) {
                Text(item.title?.userPreferred ?? "")
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding(.bottom, 2)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                Text("\(item.format?.value?.localizedName ?? "Unknown") · \(item.startDate?.year?.stringValue ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
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
