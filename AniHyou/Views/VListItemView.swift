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
            MediaCoverView(imageUrl: imageUrl, width: coverWidth, height: coverHeight, cancelOnDisappear: true)
                .padding(.top, 4)
            
            Text(title)
                .font(.system(size: 13))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
        }
        .frame(width: coverWidth + 20, height: coverHeight + 50, alignment: .top)
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
