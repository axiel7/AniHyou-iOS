//
//  AniHyouShouApp.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 11/01/2023.
//

import SwiftUI

// swiftlint:disable type_name
@main
struct AniHyouShou_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    //transfer use id from old app versions
                    if authUserId() == 0 {
                        saveUserId(id: UserDefaults.standard.integer(forKey: USER_ID_KEY))
                    }
                }
        }
    }
}
// swiftlint:enable type_name
