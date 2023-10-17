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

    let imageUrl: String?
    let width: CGFloat
    let height: CGFloat
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
    MediaCoverView(imageUrl: "", width: 73, height: 110)
        .previewLayout(.sizeThatFits)
}
