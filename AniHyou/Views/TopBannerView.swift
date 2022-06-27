//
//  TopBannerView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI
import Kingfisher

struct TopBannerView: View {
    
    var imageUrl: String?
    var placeholderHexColor: String?
    var height: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                KFImage(URL(string: imageUrl ?? ""))
                    .placeholder {
                        Rectangle()
                            .foregroundColor(Color(placeholderHexColor) ?? .gray)
                            .scaledToFill()
                    }
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
