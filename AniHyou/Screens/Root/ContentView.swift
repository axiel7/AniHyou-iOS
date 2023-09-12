//
//  ContentView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

fileprivate extension View {
    func tabItemHome() -> some View {
        self
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)
    }
    func tabItemAnime() -> some View {
        self
            .tabItem {
                Label("Anime", systemImage: "play.tv")
            }
            .tag(1)
    }
    func tabItemManga() -> some View {
        self
            .tabItem {
                Label("Manga", systemImage: "book")
            }
            .tag(2)
    }
    func tabItemProfile() -> some View {
        self
            .tabItem {
                Label("Profile", systemImage: "person")
            }
            .tag(3)
    }
    func tabItemExplore() -> some View {
        self
            .tabItem {
                Label("Explore", systemImage: "magnifyingglass")
            }
            .tag(4)
    }
}

struct ContentView: View {

    @State private var justLogged: Bool = false
    @AppStorage(SELECTED_TAB_KEY) private var selectedTabIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            HomeView()
                .tabItemHome()

            if isLoggedIn() || justLogged {
                MediaListStatusView(mediaType: .anime)
                    .tabItemAnime()
            } else {
                NotLoggedView(onSuccessLogin: { justLogged = true })
                    .tabItemAnime()
            }

            if isLoggedIn() || justLogged {
                MediaListStatusView(mediaType: .manga)
                    .tabItemManga()
            } else {
                NotLoggedView(onSuccessLogin: { justLogged = true })
                    .tabItemManga()
            }

            if isLoggedIn() || justLogged {
                ProfileView()
                    .tabItemProfile()
            } else {
                NotLoggedView(onSuccessLogin: { justLogged = true })
                    .tabItemProfile()
            }

            RootExploreView()
                .tabItemExplore()
        }//:TabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
