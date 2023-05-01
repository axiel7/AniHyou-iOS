//
//  Utils.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation

func isLoggedIn() -> Bool {
    return UserDefaults.standard.bool(forKey: "is_logged_in")
}

func userId() -> Int {
    return UserDefaults(suiteName: "group.com.axiel7.AniHyou")?.integer(forKey: USER_ID_KEY) ?? 0
}

func saveUserId(id: Int) {
    UserDefaults(suiteName: "group.com.axiel7.AniHyou")?.set(id, forKey: USER_ID_KEY)
}

func refreshUserIdAndOptions() {
    Network.shared.apollo.fetch(query: ViewerIdQuery()) { result in
        switch result {
        case .success(let graphQLResult):
            if let viewer = graphQLResult.data?.viewer {
                saveUserId(id: viewer.id)
                WatchConnectivityManager.shared.send(key: USER_ID_KEY, data: String(viewer.id))
                UserDefaults.standard.set(viewer.options?.profileColor, forKey: USER_COLOR_KEY)
                UserDefaults.standard.set(viewer.options?.staffNameLanguage?.value?.rawValue, forKey: USER_NAMES_LANG_KEY)
                UserDefaults.standard.set(viewer.options?.titleLanguage?.value?.rawValue, forKey: USER_TITLE_LANG_KEY)
                UserDefaults.standard.set(viewer.mediaListOptions?.scoreFormat?.value?.rawValue, forKey: USER_SCORE_KEY)
            }
        case .failure(let error):
            print(error)
        }
    }
}

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

