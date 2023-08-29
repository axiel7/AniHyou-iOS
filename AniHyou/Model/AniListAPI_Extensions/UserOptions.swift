//
//  UserOptions.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import Foundation

extension String {
    var profileHexColor: String {
        if self.hasPrefix("#") { return self }

        switch self {
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
            return ANIHYOU_COLOR
        }
    }
}
