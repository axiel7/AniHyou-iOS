//
//  UserActivityView.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import SwiftUI

struct UserActivityView: View {

    let userId: Int
    let isMyProfile: Bool
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
            if let listActivity = item?.asListActivity?.fragments.listActivityFragment {
                ListActivityItemView(activity: listActivity)
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
