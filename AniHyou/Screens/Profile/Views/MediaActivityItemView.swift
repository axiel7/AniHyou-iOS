//
//  MediaActivityItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 15/08/2022.
//

import SwiftUI
import AniListAPI

struct MediaActivityItemView: View {
    
    var activity: UserActivityQuery.Data.Page.Activity.AsListActivity?
    
    var body: some View {
        HStack(alignment: .center) {
            MediaCoverView(imageUrl: activity?.media?.coverImage?.medium ?? "", width: 53, height: 80, cancelOnDisappear: false)
            
            VStack(alignment: .leading) {
                Text(activityText)
                    .font(.subheadline)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                
                Text((activity?.createdAt.timestampIntervalSinceNow().secondsToLegibleText() ?? "") + " ago")
                    .font(.subheadline)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
                    .padding(.top)
            }
        }
    }
    
    private var activityText: String {
        if activity?.progress != nil {
            return "\(activity?.status?.firstCapitalized ?? "") \(activity?.progress! ?? "") of \(activity?.media?.title?.userPreferred ?? "")"
        } else {
            return "\(activity?.status?.firstCapitalized ?? "") \(activity?.media?.title?.userPreferred ?? "")"
        }
    }
}

struct MediaActivityItemView_Previews: PreviewProvider {
    static var previews: some View {
        MediaActivityItemView(activity: nil)
    }
}
