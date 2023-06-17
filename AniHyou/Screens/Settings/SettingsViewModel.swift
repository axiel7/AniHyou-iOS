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
        KeychainUtils.keychain.delete(USER_TOKEN_KEY)
        UserDefaults.standard.removeObject(forKey: "user_id")
        UserDefaults.standard.removeObject(forKey: "token_expiration")
        UserDefaults.standard.removeObject(forKey: "is_logged_in")
        isLoggedOut = true
        WidgetCenter.shared.reloadAllTimelines()
        GlobalAppState.shared.globalId = UUID()
    }
    
    func syncAccountWithAppleWatch() {
        if let token = KeychainUtils.keychain.get(USER_TOKEN_KEY) {
            WatchConnectivityManager.shared.send(key: USER_TOKEN_KEY, data: token)
        }
    }
    
}
