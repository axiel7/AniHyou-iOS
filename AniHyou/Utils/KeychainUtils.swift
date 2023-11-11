//
//  KeychainUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 14/06/2023.
//

import Foundation
import KeychainSwift

class KeychainUtils {
    static let shared = KeychainUtils()
    
    private(set) lazy var keychain: KeychainSwift = {
        let newKeychain = KeychainSwift()
        newKeychain.synchronizable = true
        return newKeychain
    }()
}
