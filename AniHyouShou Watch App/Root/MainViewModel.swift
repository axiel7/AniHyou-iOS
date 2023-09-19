//
//  MainViewModel.swift
//  AniHyouShou Watch App
//
//  Created by Axel Lopez on 12/01/2023.
//

import Foundation
import KeychainSwift
import AniListAPI

class MainViewModel: ObservableObject {

    @Published var justLoggedIn = false

    func saveUserData(key: String, value: String) async {
        switch key {
        case USER_TOKEN_KEY:
            TokenAddingInterceptor.token = value
            KeychainUtils.shared.keychain.set(value, forKey: USER_TOKEN_KEY)
            getUserId()
        default:
            return
        }
    }

    func getUserId() {
        Network.shared.apollo.fetch(query: ViewerIdQuery()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let viewer = graphQLResult.data?.viewer {
                    saveUserId(id: viewer.id)
                    self?.justLoggedIn = true
                    UserDefaults.standard.set(true, forKey: "is_logged_in")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
