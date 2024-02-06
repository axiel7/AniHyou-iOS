//
//  Enums.swift
//  AniHyou
//
//  Created by Noah Kovacs on 2/5/24.
//

import Foundation
import SwiftUI

public enum StaffOnList: String, Equatable, CaseIterable {
    case yes
    case no
    case none
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .yes:
            return "Yes"
        case .no:
            return "No"
        case .none:
            return "None"
        }
    }
    
}
