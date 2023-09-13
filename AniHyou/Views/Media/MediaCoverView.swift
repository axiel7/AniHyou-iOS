//
//  MediaCoverView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI
import Kingfisher

extension KFImage {
    func imageCover(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct MediaCoverView: View {

    var imageUrl: String?
    var width: CGFloat
    var height: CGFloat
    var cancelOnDisappear = false

    var body: some View {
        KFImage(URL(string: imageUrl ?? ""))
            .placeholder {
                CoverPlaceholderView(systemName: "hourglass", width: width, height: height)
            }
            .cancelOnDisappear(cancelOnDisappear)
            .imageCover(width: width, height: height)
    }
}

#Preview {
    MediaCoverView(width: 73, height: 110)
        .previewLayout(.sizeThatFits)
}
