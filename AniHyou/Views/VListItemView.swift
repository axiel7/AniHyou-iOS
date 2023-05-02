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
    var meanScore: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            MediaCoverView(imageUrl: imageUrl, width: VListItemView.coverWidth, height: VListItemView.coverHeight, cancelOnDisappear: true)
                .padding(.top, 4)
            
            Text(title)
                .font(.system(size: 15))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
                .padding(.bottom, 1)
                .frame(width: VListItemView.coverWidth, alignment: .leading)
            
            if meanScore != nil {
                HStack(alignment: .bottom, spacing: 4) {
                    Image(systemName: "star.fill")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Text("\(meanScore!)%")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 1)
            }
        }
        .frame(minHeight: VListItemView.coverHeight + 54, alignment: .top)
    }
}

struct VListItemView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStack(alignment: .top) {
            VListItemView(title: "Kimetsu no Yaiba: Katana", imageUrl: "", meanScore: 78)
                .previewLayout(.sizeThatFits)
            VListItemView(title: "One Piece", imageUrl: "")
                .previewLayout(.sizeThatFits)
        }
    }
}
