//
//  MediaCoverView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI
import NukeUI

extension Image {
    func imageCover(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct MediaCoverView: View {

    let imageUrl: String?
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        LazyImage(url: URL(string: imageUrl ?? "")) { state in
            if let image = state.image {
                image.imageCover(width: width, height: height)
            } else if state.error != nil {
                CoverPlaceholderView(systemName: "exclamationmark.triangle", width: width, height: height)
            } else {
                CoverPlaceholderView(systemName: "hourglass", width: width, height: height)
            }
        }
    }
}

#Preview {
    MediaCoverView(imageUrl: "", width: 73, height: 110)
        .previewLayout(.sizeThatFits)
}
