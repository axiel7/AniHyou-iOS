//
//  AniHyouApp.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

@main
struct AniHyouApp: App {

    @StateObject private var globalAppState = GlobalAppState.shared
    @AppStorage(ACCENT_COLOR_KEY) private var accentColor = ANIHYOU_COLOR

    var body: some Scene {
        WindowGroup {
            ContentView()
                .id(globalAppState.globalId)
                .tint(Color(hex: accentColor) ?? .accentColor)
                .onAppear {
                    KeychainUtils.keychain.synchronizable = true
                    //transfer user id from old app versions
                    if authUserId() == 0 {
                        saveUserId(id: UserDefaults.standard.integer(forKey: USER_ID_KEY))
                    }
                }
        }
    }
}
