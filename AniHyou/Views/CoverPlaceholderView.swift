//
//  CoverPlaceholderView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

struct CoverPlaceholderView: View {
    let systemName: String
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .foregroundStyle(.gray)
                .frame(width: width, height: height)
            Image(systemName: systemName)
                .foregroundStyle(.white)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoverPlaceholderView(systemName: "hourglass", width: 80, height: 120)
}
