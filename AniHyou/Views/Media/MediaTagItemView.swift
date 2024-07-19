//
//  MediaTagItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/01/2023.
//

import SwiftUI
import SwiftUIFlow
import AniListAPI

private extension MediaTagItemView {
    @ViewBuilder
    func spoilerOverlay(_ tint: Color) -> some View {
        if tag?.isMediaSpoiler == true {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke()
                .foregroundStyle(tint)
        } else {
            EmptyView()
        }
    }
}

struct MediaTagItemView: View {

    let tag: MediaDetailsQuery.Data.Media.Tag?
    @State private var showTagDescription = false
    @Environment(\.colorScheme) private var colorScheme
    //for some reason on macOS Color.primary doesn't use the same color for text and shapes
    var tint: Color {
        colorScheme == .light ? .black : .white
    }

    var body: some View {
        HStack {
            Text("\(tag?.rank ?? 0)%")
                .font(.subheadline)
            Text(tag?.name ?? "Unknown")
                .font(.subheadline)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay {
            spoilerOverlay(tint)
        }
        .foregroundStyle(tint)
        .onTapGesture {
            showTagDescription = true
        }
        .popover(isPresented: $showTagDescription) {
            Text(tag?.description ?? "No description")
                .padding()
        }
    }
}

#Preview {
    VFlow(alignment: .leading) {
        ForEach((1...10), id: \.self) { _ in
            MediaTagItemView(tag: nil)
        }
    }
}
