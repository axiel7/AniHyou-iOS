//
//  VListItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

private let coverWidth: CGFloat = 80
private let coverHeight: CGFloat = 120

struct VListItemView: View {
    var title: String
    var imageUrl: String?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl ?? "")) { phase in
                if let image = phase.image {
                    image.imageCover()
                } else if phase.error != nil {
                    CoverPlaceholderView(systemName: "exclamationmark.triangle", width: coverWidth, height: coverHeight)
                } else {
                    CoverPlaceholderView(systemName: "hourglass", width: coverWidth, height: coverHeight)
                }
            }
            
            Text(title)
                .font(.system(size: 13))
                .padding(.bottom, 2)
                .lineLimit(2)
        }
        .frame(width: coverWidth + 15)
    }
}

struct VListItemView_Previews: PreviewProvider {
    static var previews: some View {
        VListItemView(title: "Cowboy Bebop: Tengoku no Tobira and a large title", imageUrl: "")
    }
}
