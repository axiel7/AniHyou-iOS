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
                return Color("Score10")
            case 2:
                return Color("Score30")
            case 3:
                return Color("Score50")
            case 4:
                return Color("Score80")
            case 5:
                return Color("Score100")
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

    func smileyIcon(score: Int) -> String {
        switch score {
        case 1:
            return "sentiment.dissatisfied"
        case 2:
            return "sentiment.neutral"
        case 3:
            return "sentiment.satisfied"
        default:
            return ""
        }
    }
}
