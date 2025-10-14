//
//  AniHyouApp.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI
import BackgroundTasks

@main
struct AniHyouApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var globalAppState = GlobalAppState.shared
    @AppStorage(ACCENT_COLOR_KEY, store: UserDefaults(suiteName: ANIHYOU_GROUP)) private var accentColor = ANIHYOU_COLOR

    var body: some Scene {
        WindowGroup {
            ContentView()
                .id(globalAppState.globalId)
                .tint(Color(hex: accentColor) ?? .accentColor)
                .task {
                    //transfer user id from old app versions
                    if LoginRepository.authUserId() == 0 {
                        LoginRepository.saveUserId(id: UserDefaults.standard.integer(forKey: USER_ID_KEY))
                    }
                    await scheduleNotificationFetch()
                }
        }
        .backgroundTask(.appRefresh(FETCH_NOTIFICATIONS_BACKGROUND_TASK_IDENTIFIER)) {
            NotificationsManager.scheduleFetch(
                repeatHours: UserDefaults.standard.integer(forKey: NOTIFICATIONS_FETCH_REPEAT_KEY)
            )
            await NotificationsManager.fetchAndSendNotifications()
        }
    }
    
    func scheduleNotificationFetch() async {
        if UserDefaults.standard.bool(forKey: NOTIFICATIONS_ENABLED_KEY) {
            let requests = await BGTaskScheduler.shared.pendingTaskRequests()
            if requests.isEmpty {
                NotificationsManager.scheduleFetch(
                    repeatHours: UserDefaults.standard.integer(forKey: NOTIFICATIONS_FETCH_REPEAT_KEY)
                )
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
