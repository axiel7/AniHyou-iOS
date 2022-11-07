//
//  ProfileViewModel.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import SwiftUI
import KeychainSwift

class ProfileViewModel: ObservableObject {
    
    @Published var userInfo: UserInfo?
    
    func getMyUserInfo() {
        Network.shared.apollo.fetch(query: ViewerQuery()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let viewer = graphQLResult.data?.viewer?.fragments.userInfo {
                    self?.userInfo = viewer
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
    
    @Published var isLoggedOut = false
    
    func logOut() {
        KeychainSwift().delete(USER_TOKEN_KEY)
        UserDefaults.standard.removeObject(forKey: "user_id")
        UserDefaults.standard.removeObject(forKey: "token_expiration")
        UserDefaults.standard.removeObject(forKey: "is_logged_in")
        isLoggedOut = true
    }
    
    @Published var userAbout: String?
    
    func getUserAbout(userId: Int) {
        Network.shared.apollo.fetch(query: UserAboutQuery(userId: .some(userId))) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let about = graphQLResult.data?.user?.about {
                    self?.userAbout = about
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension UserInfo {
    var hexColor: String {
        if let color = self.options?.profileColor {
            if color.hasPrefix("#") { return color }
            
            switch color {
            case "blue":
                return "#3DB4F2"
            case "purple":
                return "#C063FF"
            case "pink":
                return "#FC9DD6"
            case "orange":
                return "#EF881B"
            case "red":
                return "#E13433"
            case "green":
                return "#4DCA51"
            case "gray":
                return "#677B94"
            default:
                return "#3DB4F2"
            }
        }
        else { return "#3DB4F2" }
    }
}
