//
//  SettingsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 22/7/22.
//

import SwiftUI
import WatchConnectivity

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @ObservedObject private var connectivityManager = WatchConnectivityManager.shared
    @State private var showLogOutDialog = false
    private let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    @AppStorage(LIST_STYLE_KEY) private var listStyle = 0
    
    var body: some View {
        Form {
            Section {
                Picker("List style", selection: $listStyle) {
                    Text("Standard").tag(0)
                    Text("Compact").tag(2)
                    Text("Minimal").tag(1)
                }
            } header: {
                Text("Display")
            }
            
            Section {
                Link("AniList account settings", destination: URL(string: "https://anilist.co/settings/account")!)
            } footer: {
                Text("You may need to login again in your browser")
            }
            
            Section {
                if connectivityManager.isWatchAppInstalled {
                    Button("Sync account with Apple Watch") {
                        viewModel.syncAccountWithAppleWatch()
                    }
                }
                Button("Log out", role: .destructive) {
                    showLogOutDialog = true
                }
                .confirmationDialog("Are you sure you want to log out?", isPresented: $showLogOutDialog) {
                    Button("Log out", role: .destructive) {
                        viewModel.logOut()
                    }
                } message: {
                    Text("Are you sure you want to log out?")
                }
            }
            
            Section {
                Link("GitHub repository", destination: URL(string: "https://github.com/axiel7/AniHyou")!)
            } header: {
                Text("Information")
            } footer: {
                Text("Version \(appVersion ?? "")")
            }
            
            Section("Developers") {
                Link("axiel7", destination: URL(string: "https://github.com/axiel7")!)
                Link("BitForger", destination: URL(string: "https://github.com/BitForger")!)
                Link("SquishyLeaf", destination: URL(string: "https://github.com/SquishyLeaf")!)
            }
            
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
