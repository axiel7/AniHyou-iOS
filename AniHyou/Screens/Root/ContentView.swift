//
//  ContentView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI
import AniListAPI

struct ContentView: View {

    @AppStorage(SELECTED_TAB_KEY) private var selectedTabIndex: Int = 0
    @AppStorage(DEFAULT_TAB_KEY) private var defaultTab: Int = -1
    @AppStorage(LOGGED_IN_KEY) private var isLoggedIn: Bool = false
    @AppStorage(USER_SCORE_KEY) private var myScoreFormatRawValue = ScoreFormat.point100.rawValue
    var myScoreFormat: ScoreFormat {
        ScoreFormat(rawValue: myScoreFormatRawValue) ?? .point100
    }

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            Tab(MainTab.home.localizedName,
                systemImage: MainTab.home.systemImage,
                value: MainTab.home.rawValue
            ) {
                HomeView(isLoggedIn: isLoggedIn)
                    .environment(\.scoreFormat, myScoreFormat)
            }
            
            Tab(MainTab.anime.localizedName,
                systemImage: MainTab.anime.systemImage,
                value: MainTab.anime.rawValue
            ) {
                if isLoggedIn {
                    MediaListStatusView(mediaType: .anime)
                        .id(MediaType.anime)
                        .environment(\.scoreFormat, myScoreFormat)
                } else {
                    NotLoggedView()
                }
            }
            
            Tab(MainTab.manga.localizedName,
                systemImage: MainTab.manga.systemImage,
                value: MainTab.manga.rawValue
            ) {
                if isLoggedIn {
                    MediaListStatusView(mediaType: .manga)
                        .id(MediaType.manga)
                        .environment(\.scoreFormat, myScoreFormat)
                } else {
                    NotLoggedView()
                }
            }
            
            Tab(MainTab.profile.localizedName,
                systemImage: MainTab.profile.systemImage,
                value: MainTab.profile.rawValue
            ) {
                if isLoggedIn {
                    ProfileView()
                } else {
                    NotLoggedView()
                }
            }
            
            Tab(MainTab.explore.localizedName,
                systemImage: MainTab.explore.systemImage,
                value: MainTab.explore.rawValue,
                role: .search
            ) {
                RootExploreView()
            }
        }//:TabView
        .tabViewStyle(.sidebarAdaptable)
        .onAppear {
            if defaultTab != -1 {
                selectedTabIndex = defaultTab
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
