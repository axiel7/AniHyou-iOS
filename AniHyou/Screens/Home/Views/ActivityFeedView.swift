//
//  ActivityFeedView.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import SwiftUI

struct ActivityFeedView: View {
    
    @StateObject private var viewModel = ActivityFeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.activities, id: \.self) {
                        if let textActivity = $0.asTextActivity?.fragments.textActivityFragment {
                            TextActivityItemView(activity: textActivity)
                            Divider()
                        } else if let listActivity = $0.asListActivity?.fragments.listActivityFragment {
                            ListActivityItemView(activity: listActivity)
                            Divider()
                        }
                    }
                    if viewModel.hasNextPage {
                        HorizontalProgressView()
                            .padding()
                            .onAppear {
                                viewModel.getActivities()
                            }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Menu {
                    Menu("Activity type") {
                        Picker("Activity type", selection: $viewModel.type) {
                            ForEach(ActivityFeedType.allCases, id: \.self) { type in
                                Text(type.lozalizedName).tag(type)
                            }
                        }
                        .onChange(of: viewModel.type) { _ in
                            viewModel.refresh()
                        }
                    }
                    Menu("Feed type") {
                        Picker("Feed type", selection: $viewModel.isFollowing) {
                            Text("Following").tag(true)
                            Text("Global").tag(false)
                        }
                        .onChange(of: viewModel.isFollowing) { _ in
                            viewModel.refresh()
                        }
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
            }
        }
    }
}

#Preview {
    ActivityFeedView()
}
