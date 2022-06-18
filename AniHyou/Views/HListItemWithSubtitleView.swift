//
//  ListItemHorizontalView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

private let coverWidth: CGFloat = 80
private let coverHeight: CGFloat = 120

extension Image {
    func imageCover(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct HListItemWithSubtitleView: View {
    var title: String
    var subtitle: String
    var imageUrl: String?
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageUrl ?? "")) { phase in
                if let image = phase.image {
                    image.imageCover(width: coverWidth, height: coverHeight)
                } else if phase.error != nil {
                    CoverPlaceholderView(systemName: "exclamationmark.triangle", width: coverWidth, height: coverHeight)
                } else {
                    CoverPlaceholderView(systemName: "hourglass", width: coverWidth, height: coverHeight)
                }
            }
            .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                    .padding(.bottom, 2)
                    .lineLimit(2)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
        }//:HStack
        .frame(width: 280, height: coverHeight + 20, alignment: .leading)
        .padding(.leading, 8)
    }
}

struct HListItemWithSubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        HListItemWithSubtitleView(title: "Cowboy Bebop: Tengoku no Tobira and a large title", subtitle: "Airing in 59 min", imageUrl: "https://picsum.photos/300/200")
    }
}
