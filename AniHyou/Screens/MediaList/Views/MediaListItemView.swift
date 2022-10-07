//
//  MediaListItem.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI

private let coverWidth: CGFloat = 77
private let coverHeight: CGFloat = 115

struct MediaListItemView: View {
    
    var item: UserMediaListQuery.Data.Page.MediaList
    
    var body: some View {
        HStack {
            MediaCoverView(imageUrl: item.media?.coverImage?.large, width: coverWidth, height: coverHeight, cancelOnDisappear: false)
            
            VStack(alignment: .leading) {
                Text(item.media?.title?.userPreferred ?? "")
                    .lineLimit(2)
                
                Spacer()
                
                if let airing = item.media?.nextAiringEpisode {
                    let isBehind = item.progress ?? 0 < airing.episode - 1
                    
                    Text(isBehind ? "\((airing.episode - 1) - (item.progress ?? 0)) episodes behind" : "Ep \(airing.episode) airing in \(airing.timeUntilAiring.secondsToLegibleText())")
                        .foregroundColor(isBehind ? .accentColor : .gray)
                        .font(.subheadline)
                        .lineLimit(1)
                        .padding(.bottom, 1)
                }
                
                Text("\(item.progress ?? 0)/\(totalProgress ?? 0)")
                ProgressView(value: Float(item.progress ?? 0), total: Float(totalProgress ?? Int.max))
            }
        }
        .frame(height: coverHeight)
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
    
    var totalProgress: Int? {
        if item.media?.type?.value == .anime {
            return item.media?.episodes
        } else {
            return item.media?.chapters
        }
    }
}

struct MediaListItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        MediaListItemView(item: UserMediaListQuery.Data.Page.MediaList(fieldData: nil, variables: nil))
            .previewLayout(.sizeThatFits)
    }
}
