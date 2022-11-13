//
//  SettingsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 22/7/22.
//

import Foundation
import KeychainSwift

class SettingsViewModel: ObservableObject {
    
    @Published var isLoggedOut = false
    
    func logOut() {
        KeychainSwift().delete(USER_TOKEN_KEY)
        UserDefaults.standard.removeObject(forKey: "user_id")
        UserDefaults.standard.removeObject(forKey: "token_expiration")
        UserDefaults.standard.removeObject(forKey: "is_logged_in")
        isLoggedOut = true
        GlobalAppState.shared.globalId = UUID()
    }
    
}
