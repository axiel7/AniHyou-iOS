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
            if showSpoiler.wrappedValue {
                RoundedRectangle(cornerRadius: 8)
                    .stroke()
                    .foregroundColor(tint)
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(tint)
            }
        } else {
            EmptyView()
        }
    }
}

struct MediaTagItemView: View {

    let tag: MediaDetailsQuery.Data.Media.Tag?
    var showSpoiler: Binding<Bool>
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
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 8))
        .overlay {
            spoilerOverlay(tint)
        }
        .foregroundColor(tint)
        .onTapGesture {
            if tag?.isMediaSpoiler == true {
                if showSpoiler.wrappedValue {
                    showTagDescription = true
                }
            } else {
                showTagDescription = true
            }
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
            MediaTagItemView(tag: nil, showSpoiler: .constant(false))
        }
    }
}
