//
//  ListItemHorizontalView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

struct HListItemWithSubtitleView: View {
    
    static let coverWidth: CGFloat = 90
    static let coverHeight: CGFloat = 130
    
    var title: String?
    var subtitle: String?
    var imageUrl: String?
    
    var body: some View {
        HStack {
            MediaCoverView(imageUrl: imageUrl, width: HListItemWithSubtitleView.coverWidth, height: HListItemWithSubtitleView.coverHeight, cancelOnDisappear: true)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text(title ?? "")
                    .font(.system(size: 16))
                    .foregroundColor(.primary)
                    .padding(.bottom, 1)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(subtitle ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
        }//:HStack
    }
}

struct HListItemWithSubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        HListItemWithSubtitleView(title: "Cowboy Bebop: Tengoku no Tobira and a large title", subtitle: "Airing in 59 min", imageUrl: "https://picsum.photos/300/200")
            .frame(width: 280, alignment: .leading)
            .padding(.leading, 8)
            .previewLayout(.sizeThatFits)
    }
}
