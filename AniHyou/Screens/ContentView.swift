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
                Image(systemName: "play.tv")
                Text("Anime")
            }
    }
    func tabItemManga() -> some View {
        self
            .tabItem {
                Image(systemName: "book")
                Text("Manga")
            }
    }
    func tabItemProfile() -> some View {
        self
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
    }
}

struct ContentView: View {
    
    @State var justLogged: Bool = false
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
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
