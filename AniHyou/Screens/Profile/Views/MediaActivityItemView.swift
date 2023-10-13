//
//  MediaActivityItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 15/08/2022.
//

import SwiftUI
import AniListAPI

struct MediaActivityItemView: View {

    let activity: UserActivityQuery.Data.Page.Activity.AsListActivity?

    var body: some View {
        HStack(alignment: .center) {
            MediaCoverView(
                imageUrl: activity?.media?.coverImage?.medium ?? "",
                width: 53,
                height: 80,
                cancelOnDisappear: false
            )

            VStack(alignment: .leading) {
                Text(activityText)
                    .font(.subheadline)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)

                Group {
                    Text(activity?.createdAt.timestampIntervalSinceNow().secondsToLegibleText() ?? "") +
                    Text(" ago")
                }
                .font(.subheadline)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
                .padding(.top)
            }
        }
    }

    private var activityText: String {
        if let progress = activity?.progress {
            return String(swiftLintMultiline:
                activity?.status?.firstCapitalized ?? "",
                " ",
                progress,
                " of ",
                activity?.media?.title?.userPreferred ?? ""
            )
        } else {
            return "\(activity?.status?.firstCapitalized ?? "") \(activity?.media?.title?.userPreferred ?? "")"
        }
    }
}

#Preview {
    MediaActivityItemView(activity: nil)
}
