//
//  RectangleTextView.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import SwiftUI

struct RectangleTextView: View {
    
    var text: String
    var color: Color = .accentColor
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [color, color]), startPoint: .bottom, endPoint: .top)
                        //.padding(.bottom, 20)
                )
            Text(text)
                .bold()
                .foregroundColor(.white)
        }
    }
}

struct RectangleTextView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            RectangleTextView(text: "Top 100 Anime")
                .padding(.leading)
                .frame(maxWidth: .infinity, maxHeight: 90)
            RectangleTextView(text: "Top 100 Manga", color: Color("AniListGreen"))
                .frame(maxWidth: .infinity, maxHeight: 90)
                .padding(.trailing)
        }
    }
}
