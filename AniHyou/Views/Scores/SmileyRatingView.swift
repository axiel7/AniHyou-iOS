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
            image("sentiment.dissatisfied")
                .foregroundColor(rating == 1 ? .red : offColor)
                .onTapGesture {
                    if rating == 1 {
                        rating = 0
                    } else { rating = 1 }
                }

            image("sentiment.neutral")
                .foregroundColor(rating == 2 ? .yellow : offColor)
                .onTapGesture {
                    if rating == 2 {
                        rating = 0
                    } else { rating = 2 }
                }

            image("sentiment.satisfied")
                .foregroundColor(rating == 3 ? .green : offColor)
                .onTapGesture {
                    if rating == 3 {
                        rating = 0
                    } else { rating = 3 }
                }
        }
    }

    func image(_ name: String) -> some View {
        return Image(name)
            .resizable()
            .frame(width: size, height: size)
            .padding(.horizontal)
    }
}

#Preview {
    SmileyRatingView(rating: .constant(3))
}
