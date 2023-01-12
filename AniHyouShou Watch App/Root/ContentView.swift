//
//  ContentView.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 11/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var connectivityManager = WatchConnectivityManager.shared
    @ObservedObject private var viewModel = MainViewModel()
    @AppStorage("selected_tab_index") private var selectedTabIndex: Int = 0
    
    var body: some View {
        Group {
            if isLoggedIn() || viewModel.justLoggedIn {
                TabView(selection: $selectedTabIndex) {
                    MediaListView(type: .anime)
                        .tabItem {
                            Text("Anime")
                        }
                        .tag(0)
                    MediaListView(type: .manga)
                        .tabItem {
                            Text("Manga")
                        }
                        .tag(1)
                }
                .tabViewStyle(.page)
            } else {
                VStack {
                    Image(systemName: "iphone.and.arrow.forward")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Please open the AniHyou app on your iPhone and go to Profile -> Settings -> Sync account with Apple Watch")
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
        }//:Group
        .onChange(of: connectivityManager.receivedMessage ?? "") { message in
            if !message.isEmpty {
                Task.init {
                    await viewModel.saveUserData(key: connectivityManager.key, value: message)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
