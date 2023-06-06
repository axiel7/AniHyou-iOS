//
//  StaffMediaGrouped.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/06/2023.
//

import Foundation
import AniListAPI

struct StaffMediaGrouped: Equatable {
    let value: StaffMediaQuery.Data.Staff.StaffMedia.Edge
    let staffRoles: [String]
}
