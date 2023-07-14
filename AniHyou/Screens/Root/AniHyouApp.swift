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
    @State private var openMediaDetails = false
    @State private var mediaId = 0
    @AppStorage(ACCENT_COLOR_KEY) private var accentColor = ANIHYOU_COLOR
    
    var body: some Scene {
        WindowGroup {
            Group {
                if openMediaDetails == false {
                    ContentView()
                        .id(globalAppState.globalId)
                        .onAppear {
                            KeychainUtils.keychain.synchronizable = true
                            //transfer use id from old app versions
                            if authUserId() == 0 {
                                saveUserId(id: UserDefaults.standard.integer(forKey: USER_ID_KEY))
                            }
                        }
                } else {
                    NavigationView {
                        MediaDetailsView(mediaId: mediaId)
                            .id(mediaId)
                    }
                }
            }
            .onOpenURL { url in
                if url.scheme == "anihyou" {
                    openMediaDetails = true
                    mediaId = Int(url.lastPathComponent) ?? 0
                }
            }
            .tint(Color(hex: accentColor) ?? .accentColor)
        }
    }
}
