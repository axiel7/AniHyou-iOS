//
//  MediaListItem.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI

private let coverWidth: CGFloat = 73
private let coverHeight: CGFloat = 110

struct MediaListItemView: View {
    
    var item: UserMediaListQuery.Data.Page.MediaList
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.media?.coverImage?.large ?? "")) { phase in
                if let image = phase.image {
                    image.imageCover(width: coverWidth, height: coverHeight)
                } else if phase.error != nil {
                    CoverPlaceholderView(systemName: "exclamationmark.triangle", width: coverWidth, height: coverHeight)
                } else {
                    CoverPlaceholderView(systemName: "hourglass", width: coverWidth, height: coverHeight)
                }
            }
            
            VStack(alignment: .leading) {
                Text(item.media?.title?.userPreferred ?? "")
                    .lineLimit(2)
                
                Spacer()
                
                Text("\(item.progress ?? 0)/\(totalProgress ?? 0)")
                ProgressView(value: Float(item.progress ?? 0), total: Float(totalProgress ?? 100))
            }
        }
        .frame(height: coverHeight)
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
    
    var totalProgress: Int? {
        if item.media?.type == .anime {
            return item.media?.episodes
        } else {
            return item.media?.chapters
        }
    }
}

struct MediaListItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        MediaListItemView(item: UserMediaListQuery.Data.Page.MediaList())
            .previewLayout(.sizeThatFits)
    }
}
