//
//  Character.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/10/2024.
//

import SwiftUI
import AniListAPI

extension CharacterDetailsQuery.Data.Character {
    
    var genderLocalized: LocalizedStringKey? {
        switch gender {
        case "Male":
            return "Male"
        case "Female":
            return "Female"
        case "Non-binary":
            return "Non-binary"
        default:
            return nil
        }
    }
}
