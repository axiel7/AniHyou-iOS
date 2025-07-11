//
//  FullImageView.swift
//  AniHyou
//
//  Created by Axel Lopez on 4/7/22.
//

import SwiftUI
import NukeUI

//private var image: Image?

struct FullCoverView: View {

    var imageUrl: String?
    @Environment(\.dismiss) private var dismiss
    @State private var screenWidth = UIScreen.main.bounds.width - 100
    @State private var screenHeight = UIScreen.main.bounds.height - 180

    var body: some View {
        NavigationStack {
            VStack {
                LazyImage(url: URL(string: imageUrl ?? "")) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .minimumScaleFactor(1)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            .padding()
                            .onDrag {
                                if let uiImage = try? state.result?.get().image {
                                    NSItemProvider(object: uiImage)
                                } else {
                                    NSItemProvider(contentsOf: URL(string: imageUrl ?? "")) ?? NSItemProvider()
                                }
                            }
                    } else if state.error != nil {
                        CoverPlaceholderView(systemName: "exclamationmark.triangle", width: 100, height: 180)
                    } else {
                        ProgressView()
                    }
                }
            }//:VStack
            .toolbar {
                if #available(iOS 26, *) {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: { dismiss() }) {
                            Label("Close", systemImage: "xmark")
                        }
                    }
                } else {
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: { dismiss() }) {
                            Text("Done").bold()
                        }
                        .tint(nil)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }//:NavigationStack
    }
}

#Preview {
    FullCoverView(imageUrl: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png")
}
