//
//  MediaCoverView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI

extension Image {
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
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl ?? "")) { phase in
            if let image = phase.image {
                image.imageCover(width: width, height: height)
            } else if phase.error != nil {
                CoverPlaceholderView(systemName: "exclamationmark.triangle", width: width, height: height)
            } else {
                CoverPlaceholderView(systemName: "hourglass", width: width, height: height)
            }
        }
    }
}

struct MediaCoverView_Previews: PreviewProvider {
    static var previews: some View {
        MediaCoverView(width: 73, height: 110)
            .previewLayout(.sizeThatFits)
    }
}
