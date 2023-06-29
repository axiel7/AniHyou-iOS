//
//  SettingsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 22/7/22.
//

import SwiftUI
import WatchConnectivity

public enum LongSwipeDirection: String, Equatable, CaseIterable {
    case left = "Left"
    case right = "Right"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

public enum AccentColorMode: String, Equatable, CaseIterable {
    case anihyou = "Default"
    case profile = "Profile"
    case custom = "Custom"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @ObservedObject private var connectivityManager = WatchConnectivityManager.shared
    @State private var showLogOutDialog = false
    @State private var showColorPicker = false
    private let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    @AppStorage(LIST_STYLE_KEY) private var listStyle = 0
    @AppStorage(AIRING_ON_MY_LIST_KEY) private var airingOnMyList = false
    @AppStorage(INCREMENT_LONG_SWIPE_DIRECTION_KEY) private var incrementLongSwipeDirection: LongSwipeDirection = .right
    @AppStorage(USER_COLOR_KEY) private var profileColor: String?
    @AppStorage(ACCENT_COLOR_MODE_KEY) private var accentColorMode = AccentColorMode.anihyou
    @AppStorage(ACCENT_COLOR_KEY) private var accentColor = ANIHYOU_COLOR
    @AppStorage(CUSTOM_ACCENT_COLOR_KEY) private var customAccentColor = "#4D908E"
    @State private var selectedColor = Color(hex: "#4D908E")!
    
    var body: some View {
        Form {
            Section {
                Picker("List style", selection: $listStyle) {
                    Text("Standard").tag(0)
                    Text("Compact").tag(2)
                    Text("Minimal").tag(1)
                }
                Picker("Accent color", selection: $accentColorMode) {
                    ForEach(AccentColorMode.allCases, id: \.self) { mode in
                        Text(mode.localizedName).tag(mode)
                    }
                }
                .onChange(of: accentColorMode) { mode in
                    switch mode {
                    case .anihyou:
                        accentColor = ANIHYOU_COLOR
                    case .profile:
                        accentColor = profileColor ?? ANIHYOU_COLOR
                    case .custom:
                        accentColor = customAccentColor
                    }
                }
                
                if accentColorMode == .custom {
                    ColorPicker("Custom color", selection: $selectedColor, supportsOpacity: false)
                        .onChange(of: selectedColor) { color in
                            if let hex = color.toHex() {
                                customAccentColor = hex
                                accentColor = hex
                            }
                        }
                }
            } header: {
                Text("Display")
            }
            
            Section {
                Toggle("Airing on my list", isOn: $airingOnMyList)
            } footer: {
                Text("Show only airing soon anime that are in your list")
            }
            
            Section {
                Picker("Long Swipe Direction", selection: $incrementLongSwipeDirection) {
                    ForEach(LongSwipeDirection.allCases, id: \.self) { v in
                        Text(v.localizedName)
                            .tag(v)
                    }
                }
            } header: {
                Text("Increment Episode / Chapter")
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
        .onAppear {
            selectedColor = Color(hex: customAccentColor)!
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
