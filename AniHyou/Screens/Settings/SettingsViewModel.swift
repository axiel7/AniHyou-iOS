//
//  SettingsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 22/7/22.
//

import Foundation
import KeychainSwift
import WidgetKit

class SettingsViewModel: ObservableObject {

    @Published var isLoggedOut = false

    func logOut() {
        LoginRepository.logOut()
        isLoggedOut = true
        GlobalAppState.shared.globalId = UUID()
    }

    func syncAccountWithAppleWatch() {
        if let token = KeychainUtils.shared.keychain.get(USER_TOKEN_KEY) {
            WatchConnectivityManager.shared.send(key: USER_TOKEN_KEY, data: token)
        }
    }
}
