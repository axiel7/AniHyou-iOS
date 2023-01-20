//
//  MediaListItemCompactView.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/01/2023.
//

import SwiftUI

private let coverWidth: CGFloat = 70
private let coverHeight: CGFloat = 70

struct MediaListItemCompactView: View {
    
    var item: UserMediaListQuery.Data.Page.MediaList?
    
    var body: some View {
        HStack {
            MediaCoverView(imageUrl: item?.media?.coverImage?.large, width: coverWidth, height: coverHeight, cancelOnDisappear: false)
            
            VStack(alignment: .leading) {
                
                Text(item?.media?.title?.userPreferred ?? "Error loading item")
                    .lineLimit(2)
                
                if item?.media?.nextAiringEpisode != nil {
                    AiringScheduleItemText(item: item)
                        .padding(.top, 1)
                } else {
                    Spacer()
                }
                
                Text("\(item?.progress ?? 0)/\(item?.totalProgress ?? 0)")
            }//:VStack
        }//:HStack
        .padding(.vertical, 4)
    }
}

struct MediaListItemCompactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List(0...4, id: \.self) { _ in
                NavigationLink(destination: {}) {
                    MediaListItemCompactView()
                }
            }
        }
    }
}
