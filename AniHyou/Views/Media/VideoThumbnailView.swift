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
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .foregroundStyle(.black.opacity(0.2))
                .frame(width: videoWidth, height: videoHeight)
            Image(systemName: "play.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
                .padding()
                .padding(.leading, 1)
                .background(.thinMaterial, in: .circle)
        }
    }
}

#Preview {
    Link(destination: URL(string: "https://i.ytimg.com/vi/OhNwckCLzis/hqdefault.jpg")!) {
        VideoThumbnailView(imageUrl: "https://i.ytimg.com/vi/OhNwckCLzis/hqdefault.jpg")
    }
}
