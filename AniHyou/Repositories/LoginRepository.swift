//
//  Utils.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import AniListAPI
import WidgetKit

struct LoginRepository {
    
    static func authUserId() -> Int {
        UserDefaults(suiteName: ANIHYOU_GROUP)?.integer(forKey: USER_ID_KEY) ?? 0
    }
    
    static func saveUserId(id: Int) {
        UserDefaults(suiteName: ANIHYOU_GROUP)?.set(id, forKey: USER_ID_KEY)
    }
    
    static func onNewToken(_ token: String, expiresIn: String) {
        //save token in the keychain
        TokenAddingInterceptor.token = token
        KeychainUtils.shared.keychain.set(token, forKey: USER_TOKEN_KEY)
        #if os(iOS)
        //send token to apple watch
        WatchConnectivityManager.shared.send(key: USER_TOKEN_KEY, data: token)
        #endif
        //save other data to userdefaults
        UserDefaults.standard.set(expiresIn, forKey: "token_expiration")
        UserDefaults.standard.set(true, forKey: LOGGED_IN_KEY)
        // refresh widgets
        WidgetCenter.shared.reloadAllTimelines()

        refreshUserIdAndOptions()
    }
    
    static func logOut() {
        KeychainUtils.shared.keychain.delete(USER_TOKEN_KEY)
        UserDefaults.standard.removeObject(forKey: USER_ID_KEY)
        UserDefaults.standard.removeObject(forKey: "token_expiration")
        UserDefaults.standard.removeObject(forKey: LOGGED_IN_KEY)
        UserDefaults.standard.removeObject(forKey: USER_COLOR_KEY)
        UserDefaults.standard.removeObject(forKey: USER_NAMES_LANG_KEY)
        UserDefaults.standard.removeObject(forKey: USER_TITLE_LANG_KEY)
        UserDefaults.standard.removeObject(forKey: USER_SCORE_KEY)
        UserDefaults.standard.removeObject(forKey: ADVANCED_SCORING_ENABLED_KEY)
        UserDefaults.standard.removeObject(forKey: ADVANCED_SCORES_KEY)
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    static func refreshUserIdAndOptions() {
        Network.shared.apollo.fetch(query: ViewerIdQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let viewer = graphQLResult.data?.viewer {
                    saveUserId(id: viewer.id)
                    #if os(iOS)
                    WatchConnectivityManager.shared.send(key: USER_ID_KEY, data: String(viewer.id))
                    #endif
                    UserDefaults.standard.set(viewer.options?.profileColor?.profileHexColor, forKey: USER_COLOR_KEY)
                    UserDefaults.standard.set(
                        viewer.options?.staffNameLanguage?.value?.rawValue,
                        forKey: USER_NAMES_LANG_KEY
                    )
                    UserDefaults.standard.set(
                        viewer.options?.titleLanguage?.value?.rawValue,
                        forKey: USER_TITLE_LANG_KEY
                    )
                    UserDefaults.standard.set(
                        viewer.mediaListOptions?.scoreFormat?.value?.rawValue,
                        forKey: USER_SCORE_KEY
                    )
                    UserDefaults.standard.setValue(
                        viewer.mediaListOptions?.animeList?.advancedScoringEnabled,
                        forKey: ADVANCED_SCORING_ENABLED_KEY
                    )
                    UserDefaults.standard.setValue(
                        viewer.mediaListOptions?.animeList?.advancedScoring?.compactMap { $0 },
                        forKey: ADVANCED_SCORES_KEY
                    )
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
