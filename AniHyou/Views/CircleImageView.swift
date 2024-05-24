//
//  CircleImageView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI
import NukeUI

private extension Image {
    func circleImage(size: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: size, height: size, alignment: .center)
    }
}

struct CircleImageView: View {

    let imageUrl: String?
    let size: CGFloat
    var systemPlaceHolder: String = "person.circle.fill"

    var body: some View {
        LazyImage(url: URL(string: imageUrl ?? "")) { state in
            if let image = state.image {
                image
                    .circleImage(size: size)
            } else {
                Image(systemName: systemPlaceHolder)
                    .circleImage(size: size)
            }
        }
    }
}

#Preview {
    CircleImageView(imageUrl: "", size: 110)
}
