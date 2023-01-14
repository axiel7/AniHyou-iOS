//
//  MediaListItem.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI

private let coverWidth: CGFloat = 77
private let coverHeight: CGFloat = 115

struct MediaListItemStandardView: View {
    
    var item: UserMediaListQuery.Data.Page.MediaList?
    
    var body: some View {
        HStack {
            MediaCoverView(imageUrl: item?.media?.coverImage?.large, width: coverWidth, height: coverHeight, cancelOnDisappear: false)
            
            VStack(alignment: .leading) {
                Text(item?.media?.title?.userPreferred ?? "Error loading item")
                    .lineLimit(2)
                
                Spacer()
                
                if item?.media?.nextAiringEpisode != nil {
                    AiringScheduleItemText(item: item)
                }
                
                Text("\(item?.progress ?? 0)/\(item?.totalProgress ?? 0)")
                ProgressView(value: Float(item?.progress ?? 0), total: Float(item?.totalProgress ?? Int.max))
            }
        }
        .frame(height: coverHeight)
    }
}

struct AiringScheduleItemText: View {
    
    var item: UserMediaListQuery.Data.Page.MediaList?
    
    var body: some View {
        let airing = item!.media!.nextAiringEpisode!
        let isBehind = item?.progress ?? 0 < airing.episode - 1
        Text(isBehind ? "\((airing.episode - 1) - (item?.progress ?? 0)) episodes behind" : "Ep \(airing.episode) airing in \(airing.timeUntilAiring.secondsToLegibleText())")
            .foregroundColor(isBehind ? .accentColor : .gray)
            .font(.subheadline)
            .lineLimit(1)
            .padding(.bottom, 1)
    }
}

struct MediaListItemStandardView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            List(0...5, id: \.self) { _ in
                NavigationLink(destination: {}) {
                    MediaListItemStandardView(item: nil)
                }
            }
        }
    }
}
