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
    @AppStorage(LOGGED_IN_KEY) private var isLoggedIn: Bool = false

    var body: some View {
        Group {
            if isLoggedIn {
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
                    // swiftlint:disable:next line_length
                    Text("Please open the AniHyou app on your iPhone and go to Profile -> Settings -> Sync account with Apple Watch")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15))
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
        .onAppear {
            if LoginRepository.authUserId() == 0 {
                if let token = KeychainUtils.shared.keychain.get(USER_TOKEN_KEY) {
                    if !token.isEmpty {
                        viewModel.getUserId()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
