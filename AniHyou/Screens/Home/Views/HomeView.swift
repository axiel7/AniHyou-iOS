//
//  AnimesView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage(HOME_TAB_KEY) private var currentTab: HomeTab?
    @State private var unreadNotificationsCount = 0
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
                    .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
            case .activity:
                ActivityFeedView()
                    .navigationTitle("Activity")
                    .toolbar {
                        toolbarContent
                    }
                    .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
            case .current:
                CurrentView()
                    .navigationTitle("Current")
                    .toolbar {
                        toolbarContent
                    }
                    .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
            }
        }
        .task {
            unreadNotificationsCount = await UserRepository.getUnreadNotificationsCount() ?? 0
        }
        .onReceive(NotificationCenter.default.publisher(for: "readNotifications")) { _ in
            unreadNotificationsCount = 0
        }
        .sheet(isPresented: $showNotificationsSheet) {
            NotificationsView()
        }
    }
    
    @ToolbarContentBuilder
    var toolbarContent: some ToolbarContent {
        ToolbarItem {
            Button(action: { showNotificationsSheet = true }) {
                Label("Notifications", systemImage: unreadNotificationsCount > 0 ? "bell.badge" : "bell")
            }
        }
    }
}

#Preview {
    HomeView()
}
