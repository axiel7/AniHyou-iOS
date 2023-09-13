//
//  UserActivityView.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import SwiftUI

struct UserActivityView: View {

    var userId: Int
    var isMyProfile: Bool
    @StateObject private var viewModel = UserActivityViewModel()

    var body: some View {
        if !isMyProfile {
            HStack {
                Spacer()
                NavigationLink("Anime List") {
                    MediaListStatusView(mediaType: .anime, userId: userId)
                        .id(userId)
                }
                Spacer()
                NavigationLink("Manga List") {
                    MediaListStatusView(mediaType: .manga, userId: userId)
                        .id(userId)
                }
                Spacer()
            }
            .padding()
        }
        ForEach(viewModel.activities, id: \.?.id) { item in
            if let list = item?.asListActivity {
                NavigationLink(destination: MediaDetailsView(mediaId: list.media?.id ?? 0)) {
                    MediaActivityItemView(activity: list)
                        .padding(.horizontal)
                }
                Divider()
            }
        }
        if viewModel.hasNextPage {
            HorizontalProgressView()
                .onAppear {
                    viewModel.getUserActivity(userId: userId)
                }
        }
    }
}

#Preview {
    ScrollView(.vertical) {
        LazyVStack(alignment: .leading) {
            UserActivityView(userId: 208863, isMyProfile: false)
        }
    }
}
