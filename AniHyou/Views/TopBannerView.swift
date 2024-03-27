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
    let height: CGFloat

    var body: some View {
        StretchyHeader(height: height) {
            image
        }
    }
    
    var image: some View {
        KFImage(URL(string: imageUrl ?? ""))
            .placeholder {
                Rectangle()
                    .foregroundStyle(Color(hex: placeholderHexColor) ?? .gray)
                    .scaledToFill()
            }
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    ScrollView {
        VStack {
            TopBannerView(height: 120)
            Spacer()
        }
    }
}
