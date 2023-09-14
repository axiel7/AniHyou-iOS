//
//  VideoThumbnailView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/05/2023.
//

import SwiftUI

let videoWidth: CGFloat = 192
let videoHeight: CGFloat = 108

struct VideoThumbnailView: View {

    var imageUrl: String?

    var body: some View {
        ZStack {
            MediaCoverView(imageUrl: imageUrl, width: videoWidth, height: videoHeight)
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.black.opacity(0.2))
                .frame(width: videoWidth, height: videoHeight)
            Image(systemName: "play.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                .shadow(radius: 32)
        }
    }
}

#Preview {
    Link(destination: URL(string: "https://i.ytimg.com/vi/OhNwckCLzis/hqdefault.jpg")!) {
        VideoThumbnailView(imageUrl: "https://i.ytimg.com/vi/OhNwckCLzis/hqdefault.jpg")
    }
}
