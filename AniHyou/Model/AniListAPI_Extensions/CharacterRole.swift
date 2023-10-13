//
//  CharacterRole.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension CharacterRole {

    var localizedName: LocalizedStringKey {
        switch self {
        case .main:
            return "Main"
        case .supporting:
            return "Supporting"
        case .background:
            return "Background"
        }
    }
}
