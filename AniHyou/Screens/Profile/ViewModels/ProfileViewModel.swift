//
//  ProfileViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import SwiftUI
import AniListAPI

@MainActor
class ProfileViewModel: ObservableObject {

    @Published var userInfo: UserInfo?

    func getMyUserInfo() async {
        userInfo = await UserRepository.getMyUserInfo()
    }

    func getUserInfo(userId: Int) async {
        userInfo = await UserRepository.getUserInfo(userId: userId)
    }

    func toggleFollow(userId: Int) async {
        if let result = await UserRepository.toggleFollow(userId: userId) {
            userInfo = result
        }
    }
}
