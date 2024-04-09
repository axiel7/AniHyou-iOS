//
//  SettingsViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 22/7/22.
//

import Foundation
import KeychainSwift
import WidgetKit
import AniListAPI

@MainActor
class SettingsViewModel: ObservableObject {
    
    @Published var isLoggedOut = false
    @Published var isLoading = true
    
    @Published var areOptionsFetched = false
    @Published var titleLanguage = UserTitleLanguage.romaji
    @Published var staffNameLanguage = UserStaffNameLanguage.romaji
    @Published var scoreFormat = ScoreFormat.point10

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
    
    func getUserOptions() async {
        isLoading = true
        
        if let userOptions = await UserRepository.getUserOptions(),
            let options = userOptions.options
        {
            titleLanguage = options.titleLanguage?.value ?? .romaji
            staffNameLanguage = options.staffNameLanguage?.value ?? .romaji
            scoreFormat = userOptions.mediaListOptions?.scoreFormat?.value ?? .point10
            areOptionsFetched = true
        } else {
            areOptionsFetched = false
        }
        isLoading = false
    }
    
    func updateUserOptions(
        titleLanguage: UserTitleLanguage? = nil,
        staffNameLanguage: UserStaffNameLanguage? = nil,
        scoreFormat: ScoreFormat? = nil
    ) {
        Task {
            isLoading = true
            _ = await UserRepository.updateUserOptions(
                titleLanguage: titleLanguage,
                staffNameLanguage: staffNameLanguage,
                scoreFormat: scoreFormat
            )
            isLoading = false
        }
    }
}
