//
//  HeightFormatter.swift
//  AniHyou
//
//  Created by Axel on 25/11/2026.
//

import AniListAPI
import Foundation

extension HeightFragment {
    func formatted() -> String? {
        // when initial is set, then min and max are null
        if let initial = self.initial {
            return formatRange(
                metricMin: initial.metric,
                imperialMin: initial.imperial
            )
        }

        switch (self.min, self.max) {
        case (let min?, let max?):
            return formatRange(
                metricMin: min.metric,
                imperialMin: min.imperial,
                metricMax: max.metric,
                imperialMax: max.imperial
            )
        case (let min?, nil):
            return formatRange(metricMin: min.metric, imperialMin: min.imperial)
        case (nil, let max?):
            return formatRange(metricMin: max.metric, imperialMin: max.imperial)
        case (nil, nil):
            return nil
        }
    }
}

private func formatRange(
    metricMin: Double?,
    imperialMin: String?,
    metricMax: Double? = nil,
    imperialMax: String? = nil
) -> String? {
    let metricText = metricRange(min: metricMin, max: metricMax)
    let imperialText = imperialRange(min: imperialMin, max: imperialMax)

    if let metricText, let imperialText {
        return "\(metricText) (\(imperialText))"
    }
    return metricText ?? imperialText
}

private func metricRange(min: Double?, max: Double?) -> String? {
    let minValue = min.map { Int($0.rounded()) }
    let maxValue = max.map { Int($0.rounded()) }

    switch (minValue, maxValue) {
    case (let minValue?, let maxValue?) where minValue != maxValue:
        return "\(minValue) - \(maxValue) cm"
    case (let minValue?, _):
        return "\(minValue) cm"
    default:
        return nil
    }
}

private func imperialRange(min: String?, max: String?) -> String? {
    switch (min, max) {
    case (let min?, let max?) where min != max:
        return "\(min) - \(max)"
    case (let min?, _):
        return min
    default:
        return nil
    }
}
