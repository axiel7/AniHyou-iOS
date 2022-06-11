//
//  Utils.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import KeychainSwift

func isLoggedIn() -> Bool {
    //KeychainSwift().clear()
    return KeychainSwift().get(USER_TOKEN_KEY) != nil
}
