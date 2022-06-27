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
            
            Text(title)
                .font(.system(size: 13))
                .padding(.bottom, 2)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
        }
        .frame(width: coverWidth + 15)
    }
}

struct VListItemView_Previews: PreviewProvider {
    static var previews: some View {
        VListItemView(title: "Cowboy Bebop: Tengoku no Tobira and a large title", imageUrl: "")
            .previewLayout(.sizeThatFits)
    }
}
