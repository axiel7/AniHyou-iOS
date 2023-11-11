//
//  ScoreFormat.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension ScoreFormat {

    // swiftlint:disable cyclomatic_complexity
    func scoreColor(score: Double?) -> Color {
        guard score != 0 else { return .gray }
        switch self {
        case .point100:
            return Color("Score\(Int(round(score! / 10) * 10))")
        case .point10Decimal:
            return Color("Score\(Int(round(score!)) * 10)")
        case .point10:
            return Color("Score\(Int(score!) * 10)")
        case .point5:
            switch Int(score!) {
            case 1:
                return .score10
            case 2:
                return .score30
            case 3:
                return .score50
            case 4:
                return .score80
            case 5:
                return .score100
            default:
                return .gray
            }
        case .point3:
            switch Int(score!) {
            case 1:
                return .red
            case 2:
                return .yellow
            case 3:
                return .green
            default:
                return .gray
            }
        }
    }
    // swiftlint:enable cyclomatic_complexity

    func smileyIcon(score: Int) -> ImageResource? {
        switch score {
        case 1:
            return .sentimentDissatisfied
        case 2:
            return .sentimentNeutral
        case 3:
            return .sentimentSatisfied
        default:
            return nil
        }
    }
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .point100:
            return "100 Point (55/100)"
        case .point10Decimal:
            return "10 Point Decimal (5.5/10)"
        case .point10:
            return "10 Point (5/10)"
        case .point5:
            return "5 Star (3/5)"
        case .point3:
            return "3 Point Smiley :)"
        }
    }
}
