//
//  FullImageView.swift
//  AniHyou
//
//  Created by Axel Lopez on 4/7/22.
//

import SwiftUI
import Kingfisher

private var image: KFCrossPlatformImage?

struct FullCoverView: View {

    var imageUrl: String?
    @Environment(\.dismiss) private var dismiss
    @State private var screenWidth = UIScreen.main.bounds.width - 100
    @State private var screenHeight = UIScreen.main.bounds.height - 180

    var body: some View {
        NavigationStack {
            VStack {
                KFImage(URL(string: imageUrl ?? ""))
                    .placeholder {
                        ProgressView()
                    }
                    .onSuccess { result in
                        image = result.image
                    }
                    .resizable()
                    .scaleFactor(1)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()
                    .onDrag {
                        if let image = image {
                            return NSItemProvider(object: image)
                        } else {
                            return NSItemProvider(contentsOf: URL(string: imageUrl ?? "")) ?? NSItemProvider()
                        }
                    }
            }//:VStack
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { dismiss()}, label: {
                        Text("Done").bold()
                    })
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }//:NavigationStack
    }
}

#Preview {
    FullCoverView(imageUrl: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png")
}
