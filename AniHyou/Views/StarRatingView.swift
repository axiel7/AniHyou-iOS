//
//  RatingView.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/01/2023.
//

import SwiftUI

struct StarRatingView: View {
    
    @Binding var rating: Double
    
    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.accentColor
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { number in
                image(for: Double(number))
                    .foregroundColor(number > Int(rating) ? offColor : onColor)
                    .onTapGesture {
                        rating = Double(number)
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

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(rating: .constant(3))
    }
}
