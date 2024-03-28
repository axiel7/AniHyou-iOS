//
//  AnimesView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @AppStorage(HOME_TAB_KEY) private var currentTab: HomeTab?
    @State private var showNotificationsSheet = false
    @State private var mediaId = 0
    @State private var showingMediaDetails = false

    var body: some View {
        NavigationSplitView {
            List(HomeTab.allCases, id: \.self, selection: $currentTab) { tab in
                Label(tab.localizedName, systemImage: tab.systemImage)
            }
            .navigationTitle("Home")
        } detail: {
            switch currentTab {
            case .discover, nil:
                DiscoverView()
                    .navigationTitle("Discover")
                    .toolbar {
                        toolbarContent
                    }
            case .activity:
                ActivityFeedView()
                    .navigationTitle("Activity")
                    .toolbar {
                        toolbarContent
                    }
            }
        }
        .onAppear {
            viewModel.getNotificationCount()
        }
        .onReceive(NotificationCenter.default.publisher(for: "readNotifications")) { _ in
            viewModel.notificationCount = 0
        }
        .sheet(isPresented: $showNotificationsSheet) {
            NotificationsView()
        }
        .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
    }
    
    @ToolbarContentBuilder
    var toolbarContent: some ToolbarContent {
        ToolbarItem {
            Button(action: { showNotificationsSheet = true }) {
                Label("Notifications", systemImage: viewModel.notificationCount > 0 ? "bell.badge" : "bell")
            }
        }
    }
}

#Preview {
    HomeView()
}
