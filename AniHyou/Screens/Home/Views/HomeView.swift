//
//  AnimesView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

struct HomeView: View {
    
    let isLoggedIn: Bool
    @StateObject private var viewModel = HomeViewModel()
    @State private var showNotificationsSheet = false
    @State private var mediaId = 0
    @State private var showingMediaDetails = false

    var body: some View {
        NavigationSplitView {
            List(HomeTab.allCases, id: \.self, selection: $viewModel.currentTab) { tab in
                Label(tab.localizedName, systemImage: tab.systemImage)
            }
            .navigationTitle("Home")
        } detail: {
            switch viewModel.currentTab {
            case .discover:
                DiscoverView()
                    .navigationTitle("Discover")
                    .toolbar {
                        toolbarContent
                    }
                    .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
            case .activity:
                ActivityFeedView()
                    .navigationTitle("Activity")
                    .toolbar {
                        toolbarContent
                    }
                    .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
            case .current:
                Group {
                    if isLoggedIn {
                        CurrentView()
                    } else {
                        NotLoggedView()
                    }
                }
                .navigationTitle("Current")
                .toolbar {
                    toolbarContent
                }
                .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
            case nil:
                EmptyView()
            }
        }
        .task {
            await viewModel.getUnreadNotificationsCount()
        }
        .onReceive(NotificationCenter.default.publisher(for: "readNotifications")) { _ in
            viewModel.unreadNotificationsCount = 0
        }
        .sheet(isPresented: $showNotificationsSheet) {
            NotificationsView()
        }
    }
    
    @ToolbarContentBuilder
    var toolbarContent: some ToolbarContent {
        ToolbarItem {
            Button(action: { showNotificationsSheet = true }) {
                Label(
                    "Notifications",
                    systemImage: viewModel.unreadNotificationsCount > 0 ? "bell.badge" : "bell"
                )
            }
            .tint(nil)
        }
    }
}

#Preview {
    HomeView(isLoggedIn: false)
}
