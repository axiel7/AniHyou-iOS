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
            "Main"
        case .supporting:
            "Supporting"
        case .background:
            "Background"
        }
    }
}
