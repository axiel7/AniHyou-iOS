//
//  MediaCoverView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI
import NukeUI

extension Image {
    @MainActor
    func imageCover(width: CGFloat, height: CGFloat, blur: Bool = false) -> some View {
        self
            .resizable()
            .scaledToFill()
            .blur(radius: 8, isEnabled: blur)
            .frame(width: width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct MediaCoverView: View {

    let imageUrl: String?
    let width: CGFloat
    let height: CGFloat
    var blurEnabled: Bool = false

    var body: some View {
        LazyImage(url: URL(string: imageUrl ?? "")) { state in
            if let image = state.image {
                image
                    .imageCover(width: width, height: height, blur: blurEnabled)
            } else if state.error != nil {
                CoverPlaceholderView(systemName: "exclamationmark.triangle", width: width, height: height)
            } else {
                CoverPlaceholderView(systemName: "hourglass", width: width, height: height)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MediaCoverView(imageUrl: "", width: 73, height: 110)
}
