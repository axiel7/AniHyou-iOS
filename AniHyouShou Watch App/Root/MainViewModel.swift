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
        Network.shared.apollo.fetch(query: ViewerIdQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let viewer = graphQLResult.data?.viewer {
                    LoginRepository.saveUserId(id: viewer.id)
                    UserDefaults.standard.set(true, forKey: LOGGED_IN_KEY)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
