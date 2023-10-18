//
//  ActivityDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/10/2023.
//

import SwiftUI
import AniListAPI

struct ActivityDetailsView: View {
    
    @StateObject private var viewModel = ActivityDetailsViewModel()
    
    let activityId: Int
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                Group {
                    if let listActivity = viewModel.listActivity {
                        ListActivityItemView(activity: listActivity)
                    } else if let textActivity = viewModel.textActivity {
                        TextActivityItemView(activity: textActivity)
                    } else if let messageActivity = viewModel.messageActivity {
                        MessageActivityItemView(activity: messageActivity)
                    }
                }
                .padding(.top)
                Divider()
                ForEach(viewModel.replies, id: \.id) {
                    ActivityReplyItemView(reply: $0)
                }
                if viewModel.isLoading {
                    HorizontalProgressView()
                        .padding()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Activity")
        .onAppear {
            viewModel.getDetails(activityId: activityId)
        }
    }
}

#Preview {
    ActivityDetailsView(activityId: 1)
}
