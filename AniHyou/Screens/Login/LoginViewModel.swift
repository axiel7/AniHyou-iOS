//
//  ProfileViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import AuthenticationServices
import KeychainSwift

class LoginViewModel: NSObject, ObservableObject, ASWebAuthenticationPresentationContextProviding {

    private let clientId = Bundle.main.object(forInfoDictionaryKey: "ANILIST_CLIENT_ID") as? String ?? ""

    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }

    @Published var isLoginSuccess = false

    func login() {
        let authSession = ASWebAuthenticationSession(
            url: URL(string: "\(ANILIST_AUTH_URL)?client_id=\(clientId)&response_type=token")!,
            callbackURLScheme: ANIHYOU_SCHEME
        ) { [weak self] (url, error) in
            if let error = error {
                print(error)
                return
            } else if let url = url {
                self?.processResponseUrl(url: url)
            }
        }

        authSession.presentationContextProvider = self
        authSession.prefersEphemeralWebBrowserSession = true
        authSession.start()
    }

    /// Thanks to https://github.com/andyibanez
    private func processResponseUrl(url: URL) {
        let anilistComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        // Anilist actually returns the token in a messed up way.
        // All the parameters - including query parameters - are AFTER the fragment.
        // So I can't just access the query property of these components to get all the data I need.
        // To work around this and save myself the headache of possible encoding issues, I will create
        // a new URL using the fragment of the old components and some dummy domain.

        if let anilistFragment = anilistComponents?.fragment,
           let dummyURL = URL(string: "http://dummyurl.com?\(anilistFragment)"),
           let components = URLComponents(url: dummyURL, resolvingAgainstBaseURL: true),
           let queryItems = components.queryItems,
           let token = queryItems.filter({ $0.name == "access_token" }).first?.value,
           let expirationDate = queryItems.filter({ $0.name == "expires_in" }).first?.value {
            //save token in the keychain
            TokenAddingInterceptor.token = token
            KeychainUtils.shared.keychain.set(token, forKey: USER_TOKEN_KEY)
            //send token to apple watch
            WatchConnectivityManager.shared.send(key: USER_TOKEN_KEY, data: token)
            //save other data to userdefaults
            UserDefaults.standard.set(expirationDate, forKey: "token_expiration")
            UserDefaults.standard.set(true, forKey: "is_logged_in")

            refreshUserIdAndOptions()
            self.isLoginSuccess = true
        }
    }
}
