//
//  TopBannerView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI

struct TopBannerView: View {
    
    var imageUrl: String?
    var placeholderHexColor: String?
    var height: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl ?? "")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: height)
                    .clipped()
            } else {
                Image("Square")
                    .resizable()
                    .foregroundColor(Color(placeholderHexColor) ?? .gray)
                    .frame(height: height)
            }
        }
        .ignoresSafeArea()
    }
}

struct TopBannerView_Previews: PreviewProvider {
    static var previews: some View {
        TopBannerView(height: 120)
            .previewLayout(.sizeThatFits)
    }
}
