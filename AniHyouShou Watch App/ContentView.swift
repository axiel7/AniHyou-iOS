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
    
    var body: some View {
        VStack {
            if isLoggedIn() || viewModel.justLoggedIn {
                TabView {
                    Text("Anime List")
                    Text("Manga List")
                }
                .tabViewStyle(.page)
            } else {
                Image(systemName: "iphone.and.arrow.forward")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Please open the AniHyou app on your iPhone and go to Profile -> Settings -> Sync account with Apple Watch")
                    .multilineTextAlignment(.center)
            }
            
        }
        .padding()
        .onChange(of: connectivityManager.receivedMessage ?? "") { message in
            if !message.isEmpty && connectivityManager.key == USER_TOKEN_KEY {
                Task.init {
                    await viewModel.saveUserToken(message)
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
