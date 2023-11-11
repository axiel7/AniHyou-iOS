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
    
    func getUserOptions() {
        isLoading = true
        Network.shared.apollo.fetch(query: UserOptionsQuery()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if
                    let userOptions = graphQLResult.data?.viewer?.fragments.userOptionsFragment,
                    let options = userOptions.options
                {
                    self?.titleLanguage = options.titleLanguage?.value ?? .romaji
                    self?.staffNameLanguage = options.staffNameLanguage?.value ?? .romaji
                    self?.scoreFormat = userOptions.mediaListOptions?.scoreFormat?.value ?? .point10
                    self?.areOptionsFetched = true
                }
            case .failure(let error):
                print(error)
                self?.areOptionsFetched = false
            }
            self?.isLoading = false
        }
    }
    
    func updateUserOptions(
        titleLanguage: UserTitleLanguage? = nil,
        staffNameLanguage: UserStaffNameLanguage? = nil,
        scoreFormat: ScoreFormat? = nil
    ) {
        isLoading = true
        Network.shared.apollo.perform(
            mutation: UpdateUserMutation(
                displayAdultContent: .none,
                titleLanguage: someIfNotNil(titleLanguage),
                staffNameLanguage: someIfNotNil(staffNameLanguage),
                scoreFormat: someIfNotNil(scoreFormat),
                airingNotifications: .none,
                animeListOptions: .none,
                mangaListOptions: .none
            )
        ) { [weak self] result in
            switch result {
            case .success:
                break
            case .failure(let error):
                print(error)
            }
            self?.isLoading = false
        }
    }
}
