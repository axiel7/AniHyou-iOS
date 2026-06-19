//
//  AnimesView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

struct HomeView: View {
    
    let isLoggedIn: Bool
    @AppStorage(HOME_TAB_KEY) var currentTab: HomeTab = .activity
    @State private var viewModel = HomeViewModel()
    @State private var activityViewModel = ActivityFeedViewModel()
    @State private var currentViewModel = CurrentViewModel()
    @State private var showNotificationsSheet = false
    @State private var mediaId = 0
    @State private var showingMediaDetails = false
    @State private var hasScrolled = false

    var body: some View {
        NavigationStack {
            ScrollViewWithOffset(
                showsIndicators: false,
                onScroll: { hasScrolled = $0.y < 0 }
            ) {
                LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                    Section {
                        switch currentTab {
                        case .activity:
                            ActivityFeedView(viewModel: activityViewModel)
                                .navigationTitle("Home")
                        case .current:
                            Group {
                                if isLoggedIn {
                                    CurrentView(viewModel: currentViewModel)
                                } else {
                                    HStack(alignment: .center) {
                                        Spacer()
                                        NotLoggedView()
                                        Spacer()
                                    }
                                    .padding(.top)
                                }
                            }
                            .navigationTitle("Home")
                        }
                    } header: {
                        VStack(spacing: 0) {
                            Picker("", selection: $currentTab) {
                                ForEach(HomeTab.allCases, id: \.self) { tab in
                                    Label(tab.localizedName, systemImage: tab.systemImage)
                                        .tag(tab)
                                }
                            }
                            .pickerStyle(.segmented)
                            .padding(3)
                            .pinnedViewBackground(hasScrolled: hasScrolled)
                            .padding(.horizontal)
                            if #unavailable(iOS 26) {
                                Divider()
                            }
                        }
                    }
                }
            }
            .toolbar {
                toolbarContent
            }
            .refreshable {
                if currentTab == .activity {
                    await activityViewModel.refresh()
                } else if currentTab == .current && isLoggedIn {
                    await currentViewModel.fetchLists(refresh: true)
                }
            }
            .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
        }
        .task {
            await viewModel.getUnreadNotificationsCount()
        }
        .onReceive(NotificationCenter.default.publisher(for: "readNotifications")) { _ in
            viewModel.unreadNotificationsCount = 0
        }
        .sheet(isPresented: $showNotificationsSheet) {
            NotificationsView(unreadCount: viewModel.unreadNotificationsCount)
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
