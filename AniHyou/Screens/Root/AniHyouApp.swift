//
//  AniHyouApp.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

@main
struct AniHyouApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var globalAppState = GlobalAppState.shared
    @AppStorage(ACCENT_COLOR_KEY, store: UserDefaults(suiteName: ANIHYOU_GROUP)) private var accentColor = ANIHYOU_COLOR

    var body: some Scene {
        WindowGroup {
            ContentView()
                .id(globalAppState.globalId)
                .tint(Color(hex: accentColor) ?? .accentColor)
                .onAppear {
                    //transfer user id from old app versions
                    if LoginRepository.authUserId() == 0 {
                        LoginRepository.saveUserId(id: UserDefaults.standard.integer(forKey: USER_ID_KEY))
                    }
                }
        }
    }
}

extension View {
    @ViewBuilder
    func addOnOpenMediaUrl(_ showingMediaDetails: Binding<Bool>, _ mediaId: Binding<Int>) -> some View {
        self
            .onOpenURL { url in
                if url.scheme == "anihyou" {
                    mediaId.wrappedValue = Int(url.lastPathComponent) ?? 0
                    showingMediaDetails.wrappedValue = mediaId.wrappedValue != 0
                }
            }
            .navigationDestination(isPresented: showingMediaDetails) {
                MediaDetailsView(mediaId: mediaId.wrappedValue)
                    .id(mediaId.wrappedValue)
            }
    }
}
