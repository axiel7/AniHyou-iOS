//
//  StrechtyHeader.swift
//  AniHyou
//
//  Created by Axel Lopez on 27/03/2024.
//

import SwiftUI

struct StretchyHeader<Content: View>: View {
    
    let height: CGFloat
    @ViewBuilder
    let content: () -> Content
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                content()
                    .frame(
                        width: geo.size.width,
                        height: geo
                            .frame(in: .global)
                            .minY <= 0 ? geo.size.height : geo.size.height + geo
                            .frame(in: .global).minY
                    )
                    .clipped()
                Rectangle()
                    .foregroundStyle(.clear)
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
