//
//  TopBannerView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI
import NukeUI

struct TopBannerView: View {

    var imageUrl: String?
    var placeholderHexColor: String?
    let height: CGFloat

    var body: some View {
        StretchyHeader(height: height) {
            image
        }
    }
    
    @MainActor
    var image: some View {
        LazyImage(url: URL(string: imageUrl ?? "")) { state in
            if let image = state.image {
                image
                    .resizable()
                    .scaledToFill()
            } else {
                Rectangle()
                    .foregroundStyle(Color(hex: placeholderHexColor) ?? .gray)
                    .scaledToFill()
            }
        }
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
