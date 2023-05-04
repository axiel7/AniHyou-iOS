//
//  MainViewModel.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 12/01/2023.
//

import Foundation
import KeychainSwift

class MainViewModel: ObservableObject {
    
    @Published var justLoggedIn = false
    
    func saveUserData(key: String, value: String) async {
        switch key {
        case USER_TOKEN_KEY:
            KeychainSwift().set(value, forKey: USER_TOKEN_KEY)
            UserDefaults.standard.set(true, forKey: "is_logged_in")
        case USER_ID_KEY:
            let id = Int(value)
            saveUserId(id: id ?? 0)
            justLoggedIn = id != nil
            break
        default:
            return
        }
    }
}
