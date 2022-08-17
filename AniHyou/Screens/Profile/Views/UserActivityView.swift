//
//  UserActivityView.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import SwiftUI

struct UserActivityView: View {
    
    var userId: Int
    @StateObject private var viewModel = UserActivityViewModel()
    
    var body: some View {
        ForEach(viewModel.activities, id: \.?.id) { item in
            if let list = item?.asListActivity {
                Divider()
                MediaActivityItemView(activity: list)
                    .padding(.horizontal)
            }
        }
        if viewModel.hasNextPage {
            ProgressView()
                .onAppear {
                    viewModel.getUserActivity(userId: userId)
                }
        }
    }
}

struct UserActivityView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            UserActivityView(userId: 208863)
        }
    }
}
