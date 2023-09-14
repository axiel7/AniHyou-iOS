//
//  RatingView.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/01/2023.
//

import SwiftUI

struct StarRatingView: View {

    @Binding var rating: Double

    private let offImage = Image(systemName: "star")
    private let onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    @AppStorage(ACCENT_COLOR_KEY) private var accentColor = ANIHYOU_COLOR

    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) {
                let number = Double($0)
                image(for: number)
                    .foregroundColor(number > rating ? offColor : Color(hex: accentColor))
                    .onTapGesture {
                        if rating == number {
                            rating = 0
                        } else { rating = number }
                    }
            }
        }
    }

    func image(for number: Double) -> Image {
        if number > rating {
            return offImage
        } else {
            return onImage
        }
    }
}

#Preview {
    StarRatingView(rating: .constant(3))
}
