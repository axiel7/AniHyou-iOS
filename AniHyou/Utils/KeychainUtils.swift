//
//  KeychainUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 14/06/2023.
//

import Foundation
import KeychainSwift

final class KeychainUtils: Sendable {
    static let shared = KeychainUtils()
    
    let keychain: KeychainSwift
    
    init() {
        let newKeychain = KeychainSwift()
        newKeychain.synchronizable = true
        keychain = newKeychain
    }
}

extension KeychainSwift: @unchecked @retroactive Sendable {}
