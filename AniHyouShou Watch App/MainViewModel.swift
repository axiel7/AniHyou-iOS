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
    
    func saveUserToken(_ token: String) async {
        KeychainSwift().set(token, forKey: USER_TOKEN_KEY)
        UserDefaults.standard.set(true, forKey: "is_logged_in")
        justLoggedIn = true
    }
}
