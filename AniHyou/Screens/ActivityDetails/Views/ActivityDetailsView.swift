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
    
    var listActivity: ListActivityFragment?
    var textActivity: TextActivityFragment?
    var messageActivity: MessageActivityFragment?
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                Group {
                    if let listActivity {
                        ListActivityItemView(activity: listActivity)
                    } else if let textActivity {
                        TextActivityItemView(activity: textActivity)
                    } else if let messageActivity {
                        MessageActivityItemView(activity: messageActivity)
                    }
                }
                .padding(.top)
                Divider()
                ForEach(viewModel.replies, id: \.id) {
                    ActivityReplyItemView(reply: $0)
                }
                if viewModel.hasNextPage {
                    HorizontalProgressView()
                        .padding()
                        .onAppear {
                            viewModel.getReplies(activityId: id)
                        }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Activity")
    }
    
    var id: Int {
        if let id = listActivity?.id {
            return id
        } else if let id = textActivity?.id {
            return id
        } else if let id = messageActivity?.id {
            return id
        } else {
            return 0
        }
    }
}

/*#Preview {
    ActivityDetailsView()
}*/
