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

    var localizedName: LocalizedStringKey {
        switch self {
        case .left:
            "Left"
        case .right:
            "Right"
        }
    }
}

public enum AccentColorMode: String, Equatable, CaseIterable {
    case anihyou = "Default"
    case profile = "Profile"
    case custom = "Custom"

    var localizedName: LocalizedStringKey {
        switch self {
        case .anihyou:
            "AniHyou"
        case .profile:
            "Profile"
        case .custom:
            "Custom"
        }
    }
}

struct SettingsView: View {

    @State private var viewModel = SettingsViewModel()
    private var connectivityManager = WatchConnectivityManager.shared
    
    @State private var showLogOutDialog = false
    @State private var showColorPicker = false
    
    private let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    @AppStorage(LIST_STYLE_KEY) private var listStyle = 0
    
    @AppStorage(DEFAULT_TAB_KEY) private var defaultTab = -1
    
    @AppStorage(AIRING_ON_MY_LIST_KEY) private var airingOnMyList = false
    
    @AppStorage(INCREMENT_LONG_SWIPE_DIRECTION_KEY) private var incrementLongSwipeDirection: LongSwipeDirection = .right
    
    @AppStorage(USER_COLOR_KEY) private var profileColor: String?
    @AppStorage(ACCENT_COLOR_MODE_KEY) private var accentColorMode = AccentColorMode.anihyou
    @AppStorage(ACCENT_COLOR_KEY, store: UserDefaults(suiteName: ANIHYOU_GROUP)) private var accentColor = ANIHYOU_COLOR
    @AppStorage(CUSTOM_ACCENT_COLOR_KEY) private var customAccentColor = "#4D908E"
    @State private var selectedColor = Color(hex: "#4D908E")!
    
    @AppStorage(HAS_DONATED_KEY, store: UserDefaults(suiteName: ANIHYOU_GROUP)) private var hasDonated = false
    @AppStorage(NOTIFICATIONS_ENABLED_KEY) private var notificationsEnabled = false
    @State private var showDonationAlert = false
    @State private var navigateToDonations = false

    var body: some View {
        Form {
            displayOptions

            Section {
                Picker("Long Swipe Direction", selection: $incrementLongSwipeDirection) {
                    ForEach(LongSwipeDirection.allCases, id: \.self) { direction in
                        Text(direction.localizedName).tag(direction)
                    }
                }
            } header: {
                Text("Increment Episode / Chapter")
            }
            
            // content
            Section {
                Toggle("Airing on my list", isOn: $airingOnMyList)
            } footer: {
                Text("Show only airing soon anime that are in your list")
            }
            
            Section {
                Toggle("Push notifications", isOn: $notificationsEnabled)
                NavigationLink("Account settings", destination: AccountSettingsView(viewModel: viewModel))
            }

            // log in session
            Section {
                if WCSession.default.isWatchAppInstalled {
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
                AppIconSelector(
                    onNotDonated: { showDonationAlert = true }
                )
            } header: {
                Text("App Icon")
            }

            information
        }
        .navigationTitle("Settings")
        .navigationDestination(isPresented: $navigateToDonations) {
            DonationsView()
        }
        .onAppear {
            selectedColor = Color(hex: customAccentColor)!
        }
        .onChange(of: notificationsEnabled) {
            if notificationsEnabled {
                requestNotificationPermission()
            } else {
                NotificationsManager.cancelSchedule()
            }
        }
    }
    
    @ViewBuilder
    var displayOptions: some View {
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
            .onChange(of: accentColorMode) {
                switch accentColorMode {
                case .anihyou:
                    accentColor = ANIHYOU_COLOR
                case .profile:
                    accentColor = profileColor ?? ANIHYOU_COLOR
                case .custom:
                    if hasDonated {
                        accentColor = customAccentColor
                    } else {
                        accentColorMode = .anihyou
                        showDonationAlert = true
                    }
                }
            }
            .alert(
                "Donate!",
                isPresented: $showDonationAlert,
                actions: {
                    Button("Close", role: .cancel) {}
                    Button("Donate") {
                        navigateToDonations = true
                    }
                },
                message: {
                    Text("This feature will be unlocked when you make a donation, even the smallest count!")
                }
            )

            if accentColorMode == .custom {
                ColorPicker("Custom color", selection: $selectedColor, supportsOpacity: false)
                    .onChange(of: selectedColor) {
                        if let hex = selectedColor.toHex() {
                            customAccentColor = hex
                            accentColor = hex
                        }
                    }
            }
            
            Picker("Default tab", selection: $defaultTab) {
                Text("Last used").tag(-1)
                ForEach(MainTab.allCases) { tab in
                    Text(tab.localizedName).tag(tab.rawValue)
                }
            }
        } header: {
            Text("Display")
        }
    }
    
    @ViewBuilder
    var information: some View {
        Section {
            Button("Donate!") {
                navigateToDonations.toggle()
            }
            Link("GitHub repository", destination: URL(string: "https://github.com/axiel7/AniHyou-iOS")!)
            Link("Discord server", destination: URL(string: "https://discord.gg/CTv3WdfxHh")!)
        } header: {
            Text("Information")
        } footer: {
            Text("Version \(appVersion ?? "")")
        }

        Section("Developers") {
            Link("axiel7", destination: URL(string: "https://github.com/axiel7")!)
            Link("BitForger", destination: URL(string: "https://github.com/BitForger")!)
            Link("alexay7", destination: URL(string: "https://github.com/alexay7")!)
            Link("SquishyLeaf", destination: URL(string: "https://github.com/SquishyLeaf")!)
        }
        
        Section {
            NavigationLink("Translations", destination: TranslationCredits())
        }
    }
    
    private func requestNotificationPermission() {
        Task {
            do {
                try await UNUserNotificationCenter.current().requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
                NotificationsManager.scheduleFetch()
            } catch {
                DispatchQueue.main.async {
                    notificationsEnabled = false
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
