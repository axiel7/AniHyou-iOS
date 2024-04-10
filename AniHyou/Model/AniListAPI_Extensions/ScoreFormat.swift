//
//  ScoreFormat.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/08/2023.
//

import SwiftUI
import AniListAPI

extension ScoreFormat {
    
    // swiftlint:disable:next cyclomatic_complexity
    func color(score: Int?) -> Color {
        guard let score, score > 0 else { return .gray }
        switch self {
        case .point100:
            return Color("Score\((score / 10) * 10)")
        case .point10, .point10Decimal:
            return Color("Score\(score * 10)")
        case .point5:
            switch score {
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
            switch score {
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

    func smileyIcon(score: Int) -> ImageResource? {
        switch score {
        case 1:
            .sentimentDissatisfied
        case 2:
            .sentimentNeutral
        case 3:
            .sentimentSatisfied
        default:
            nil
        }
    }
    
    var localizedName: LocalizedStringKey {
        switch self {
        case .point100:
            "100 Point (55/100)"
        case .point10Decimal:
            "10 Point Decimal (5.5/10)"
        case .point10:
            "10 Point (5/10)"
        case .point5:
            "5 Star (3/5)"
        case .point3:
            "3 Point Smiley :)"
        }
    }
    
    var canUseAdvancedScoring: Bool {
        self == .point100 || self == .point10Decimal
    }
}

private struct ScoreFormatKey: EnvironmentKey {
    static let defaultValue: ScoreFormat = .point100
}

extension EnvironmentValues {
    var scoreFormat: ScoreFormat {
        get { self[ScoreFormatKey.self] }
        set { self[ScoreFormatKey.self] = newValue }
    }
}
