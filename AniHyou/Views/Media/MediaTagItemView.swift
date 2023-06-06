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
    var spoilerOverlay: some View {
        if tag?.isMediaSpoiler == true {
            if showSpoiler.wrappedValue {
                RoundedRectangle(cornerRadius: 8).stroke()
            } else {
                RoundedRectangle(cornerRadius: 8)
            }
        } else {
            EmptyView()
        }
    }
}

struct MediaTagItemView: View {
    
    var tag: MediaDetailsQuery.Data.Media.Tag?
    var showSpoiler: Binding<Bool>
    
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
            spoilerOverlay
        }
    }
}

struct MediaTagItemView_Previews: PreviewProvider {
    static var previews: some View {
        VFlow(alignment: .leading) {
            ForEach((1...10), id: \.self) { _ in
                MediaTagItemView(tag: nil, showSpoiler: .constant(false))
            }
        }
    }
}
