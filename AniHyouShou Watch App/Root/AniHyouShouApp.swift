//
//  AniHyouShouApp.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 11/01/2023.
//

import SwiftUI

@main
// swiftlint:disable:next type_name
struct AniHyouShou_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    //transfer use id from old app versions
                    if LoginRepository.authUserId() == 0 {
                        LoginRepository.saveUserId(id: UserDefaults.standard.integer(forKey: USER_ID_KEY))
                    }
                }
        }
    }
}
