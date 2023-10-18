//
//  MediaActivityItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 15/08/2022.
//

import SwiftUI
import AniListAPI

struct ListActivityItemView: View {

    let activity: ListActivityFragment
    @State var isLiked: Bool
    @State var likeCount: Int
    
    init(activity: ListActivityFragment) {
        self.activity = activity
        self.isLiked = activity.isLiked == true
        self.likeCount = activity.likeCount
    }

    var body: some View {
        HStack(alignment: .top) {
            NavigationLink(
                destination: MediaDetailsView(mediaId: activity.media?.id ?? 0)
            ) {
                MediaCoverView(
                    imageUrl: activity.media?.coverImage?.medium ?? "",
                    width: 53,
                    height: 80,
                    cancelOnDisappear: false
                )
            }
            .buttonStyle(.plain)
            .padding(.trailing)
            VStack(alignment: .leading) {
                HStack {
                    NavigationLink(destination: ProfileView(userId: activity.userId ?? 0)) {
                        HStack(alignment: .center) {
                            CircleImageView(imageUrl: activity.user?.avatar?.medium, size: 24)
                            
                            Text(activity.user?.name ?? "Loading")
                                .bold()
                                .font(.subheadline)
                                .padding(.bottom, 1)
                        }
                    }
                    .buttonStyle(.plain)
                    Spacer()
                    let createdAt = Date(timeIntervalSince1970: Double(activity.createdAt))
                    Text("\(createdAt, format: .relative(presentation: .numeric))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.bottom, 1)
                }//:HStack
                
                Text(activity.text)
                    .font(.subheadline)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)

                HStack {
                    Spacer()
                    NavigationLink(
                        destination: ActivityDetailsView(activityId: activity.id)
                    ) {
                        Label("\(activity.replyCount)", systemImage: "bubble")
                    }
                    .frame(width: 62, alignment: .leading)
                    Button(
                        action: {
                            Task {
                                if let likeResult = await LikeRepository.toggleLike(
                                    likeableId: activity.id,
                                    likeableType: .activity
                                ) {
                                    isLiked = likeResult
                                    if likeResult {
                                        likeCount += 1
                                    } else {
                                        likeCount -= 1
                                    }
                                }
                            }
                        }
                    ) {
                        Label("\(likeCount)",
                              systemImage: isLiked ? "heart.fill" : "heart"
                        )
                    }
                    .frame(width: 60, alignment: .leading)
                }//:HStack
                .padding(.top, 4)
            }//:VStack
        }//:HStack
        .padding(.horizontal)
        .padding(.vertical, 1)
    }
}

/*#Preview {
    ListActivityItemView(
        activity: ListActivityFragment(_fieldData: nil)
    )
}*/
