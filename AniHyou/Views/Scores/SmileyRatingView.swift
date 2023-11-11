//
//  SmileyRatingView.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/01/2023.
//

import SwiftUI

struct SmileyRatingView: View {

    @Binding var rating: Double
    var size: CGFloat = 30
    var offColor = Color.gray

    var body: some View {
        HStack {
            image(.sentimentDissatisfied)
                .foregroundColor(rating == 1 ? .red : offColor)
                .onTapGesture {
                    if rating == 1 {
                        rating = 0
                    } else { rating = 1 }
                }

            image(.sentimentNeutral)
                .foregroundColor(rating == 2 ? .yellow : offColor)
                .onTapGesture {
                    if rating == 2 {
                        rating = 0
                    } else { rating = 2 }
                }

            image(.sentimentSatisfied)
                .foregroundColor(rating == 3 ? .green : offColor)
                .onTapGesture {
                    if rating == 3 {
                        rating = 0
                    } else { rating = 3 }
                }
        }
    }

    func image(_ name: ImageResource) -> some View {
        return Image(name)
            .resizable()
            .frame(width: size, height: size)
            .padding(.horizontal)
    }
}

#Preview {
    SmileyRatingView(rating: .constant(3))
}
