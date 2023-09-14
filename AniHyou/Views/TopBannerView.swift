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
        GeometryReader { geo in
            ZStack {
                KFImage(URL(string: imageUrl ?? ""))
                    .placeholder {
                        Rectangle()
                            .foregroundColor(Color(hex: placeholderHexColor) ?? .gray)
                            .scaledToFill()
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: geo.size.width,
                        height: geo
                            .frame(in: .global)
                            .minY <= 0 ? geo.size.height : geo.size.height + geo
                            .frame(in: .global).minY
                    )
                    .clipped()
                Rectangle()
                    .foregroundColor(.clear)
                    .background {
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.6)]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                        .padding(.bottom, 20)
                    }
            }
            .offset(y: geo.frame(in: .global).minY <= 0 ? 0 : -geo.frame(in: .global).minY)
            .frame(
                width: geo.size.width,
                height: geo
                    .frame(in: .global)
                    .minY <= 0 ? geo.size.height : geo.size.height + geo
                    .frame(in: .global).minY
            )
        }
        .frame(minHeight: height)
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
