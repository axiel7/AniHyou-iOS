//
//  ContentView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

extension View {
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
}

struct ContentView: View {
    
    @State var justLogged: Bool = false
    @AppStorage("selected_tab_index") var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
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
            
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
