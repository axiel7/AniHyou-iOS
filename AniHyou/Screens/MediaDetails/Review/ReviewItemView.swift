//
//  ReviewView.swift
//  AniHyou
//
//  Created by Axel Lopez on 5/7/22.
//

import SwiftUI

struct ReviewItemView: View {
    
    var review: MediaReviewsQuery.Data.Medium.Review.Node
    
    var body: some View {
        VStack {
            Text(review.summary ?? "")
                .italic()
                .bold()
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.primary)
            Spacer()
            HStack {
                Text("\(review.score ?? 0)/100")
                    .foregroundColor(.primary)
                Spacer()
                Text(review.user?.name ?? "")
                    .lineLimit(1)
                    .foregroundColor(.primary)
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

struct ReviewItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewItemView(review: MediaReviewsQuery.Data.Medium.Review.Node(id: 1))
    }
}
