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
    return UserDefaults.standard.integer(forKey: "user_id")
}
