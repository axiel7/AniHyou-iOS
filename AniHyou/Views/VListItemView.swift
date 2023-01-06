//
//  VListItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

struct VListItemView: View {
    static let coverWidth: CGFloat = 90
    static let coverHeight: CGFloat = 130
    
    var title: String
    var imageUrl: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            MediaCoverView(imageUrl: imageUrl, width: VListItemView.coverWidth, height: VListItemView.coverHeight, cancelOnDisappear: true)
                .padding(.top, 4)
            
            Text(title)
                .font(.system(size: 12))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
        }
        .frame(width: VListItemView.coverWidth, height: VListItemView.coverHeight + 50, alignment: .top)
    }
}

struct VListItemView_Previews: PreviewProvider {
    static var previews: some View {
        VListItemView(title: "Cowboy Bebop: Tengoku no Tobira and a large title", imageUrl: "")
            .previewLayout(.sizeThatFits)
        VListItemView(title: "One Piece", imageUrl: "")
            .previewLayout(.sizeThatFits)
    }
}
