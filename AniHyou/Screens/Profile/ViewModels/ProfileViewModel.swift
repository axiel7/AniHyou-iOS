//
//  ProfileViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import SwiftUI
import KeychainSwift
import AniListAPI

class ProfileViewModel: ObservableObject {

    @Published var userInfo: UserInfo?

    func getMyUserInfo() {
        Network.shared.apollo.fetch(query: ViewerQuery()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let viewer = graphQLResult.data?.viewer?.fragments.userInfo {
                    self?.userInfo = viewer
                    //update preferences
                    UserDefaults.standard.set(
                        viewer.options?.profileColor?.profileHexColor,
                        forKey: USER_COLOR_KEY
                    )
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
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func getUserInfo(userId: Int) {
        Network.shared.apollo.fetch(query: UserBasicInfoQuery(userId: .some(userId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let user = graphQLResult.data?.user?.fragments.userInfo {
                    self?.userInfo = user
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func toggleFollow(userId: Int) {
        Network.shared.apollo.perform(mutation: ToggleFollowMutation(userId: .some(userId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let user = graphQLResult.data?.toggleFollow {
                    self?.onToggleFollow(userId: userId, followed: user.isFollowing)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    private func onToggleFollow(userId: Int, followed: Bool?) {
        Network.shared.apollo.store.withinReadWriteTransaction({ [weak self] transaction in
            do {
                try transaction.updateObject(
                    ofType: UserInfo.self,
                    withKey: "User:\(userId)"
                ) { (cachedData: inout UserInfo) in
                    cachedData.isFollowing = followed
                }
                let newObject = try transaction.readObject(ofType: UserInfo.self, withKey: "User:\(userId)")
                DispatchQueue.main.async {
                    self?.userInfo = newObject
                }
            } catch {
                print(error)
            }
        })
    }
}
