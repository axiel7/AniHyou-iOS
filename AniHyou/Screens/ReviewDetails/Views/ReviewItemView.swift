//
//  ReviewView.swift
//  AniHyou
//
//  Created by Axel Lopez on 5/7/22.
//

import SwiftUI
import AniListAPI

struct ReviewItemView: View {

    let review: MediaReviewsQuery.Data.Media.Reviews.Node

    var body: some View {
        VStack {
            Text(review.summary ?? "")
                .italic()
                .bold()
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(.primary)
            Spacer()
            HStack {
                Text("\(review.score ?? 0)/100")
                    .foregroundStyle(.primary)
                Spacer()
                Text(review.user?.name ?? "")
                    .lineLimit(1)
                    .foregroundStyle(.primary)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom)
        }
        .frame(width: 300, height: 150)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ReviewItemView(review: .init(_fieldData: nil))
}
