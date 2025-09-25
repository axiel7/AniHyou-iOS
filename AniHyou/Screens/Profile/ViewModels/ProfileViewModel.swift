//
//  ProfileViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import SwiftUI
import AniListAPI

@Observable class ProfileViewModel {

    var userInfo: UserInfo?
    
    var isLoading: Bool {
        userInfo == nil
    }

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
