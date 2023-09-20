//
//  ContentView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

fileprivate extension View {
    func tabItem(_ tab: MainTab) -> some View {
        self
            .tabItem {
                Label(tab.localizedName, systemImage: tab.systemImage)
            }
            .tag(tab.rawValue)
    }
}

struct ContentView: View {

    @AppStorage(SELECTED_TAB_KEY) private var selectedTabIndex: Int = 0
    @AppStorage(LOGGED_IN_KEY) private var isLoggedIn: Bool = false

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            HomeView()
                .tabItem(.home)
            
            if isLoggedIn {
                MediaListStatusView(mediaType: .anime)
                    .tabItem(.anime)
            } else {
                NotLoggedView()
                    .tabItem(.anime)
            }
            
            if isLoggedIn {
                MediaListStatusView(mediaType: .manga)
                    .tabItem(.manga)
            } else {
                NotLoggedView()
                    .tabItem(.manga)
            }
            
            if isLoggedIn {
                ProfileView()
                    .tabItem(.profile)
            } else {
                NotLoggedView()
                    .tabItem(.profile)
            }
            
            RootExploreView()
                .tabItem(.explore)
        }//:TabView
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
