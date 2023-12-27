//
//  DateUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation
import SwiftUI
import AniListAPI

extension Date {
    var tomorrow: Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)
    }

    var year: Int {
        return Calendar(identifier: .gregorian).component(.year, from: self)
    }

    var month: Int {
        return Calendar(identifier: .gregorian).component(.month, from: self)
    }

    var day: Int {
        return Calendar(identifier: .gregorian).component(.day, from: self)
    }

    var weekday: Int {
        return Calendar(identifier: .gregorian).component(.weekday, from: self)
    }

    var season: MediaSeason {
        switch self.month {
        case 1, 2, 12:
            return .winter
        case 3, 4, 5:
            return .spring
        case 6, 7, 8:
            return .summer
        case 9, 10, 11:
            return .fall
        default:
            return .spring
        }
    }

    func getCurrentAnimeSeason() -> AnimeSeason {
        var animeSeason = AnimeSeason(year: self.year, season: self.season)
        //if december, the winter season is next year
        if self.month == 12 {
            animeSeason.year += 1
        }

        return animeSeason
    }

    func getNextAnimeSeason() -> AnimeSeason {
        var current = getCurrentAnimeSeason()
        switch current.season {
        case .winter:
            current.season = .spring
        case .spring:
            current.season = .summer
        case .summer:
            current.season = .fall
        case .fall:
            current.season = .winter
            current.year += 1
        }
        return current
    }

    /// returns the requesed weekday timestamp (start or end of the day)
    func getThisWeekdayTimestamp(weekday: Int, isEndOfDay: Bool) -> Int {
        let diff = weekday - self.weekday
        if let weekdayDate = Calendar.current.date(byAdding: .day, value: diff, to: self) {
            if isEndOfDay {
                return Int(Calendar.current.date(
                    byAdding: DateComponents(day: 1, second: -1),
                    to: weekdayDate)!.timeIntervalSince1970
                )
            } else {
                return Int(Calendar.current.startOfDay(for: weekdayDate).timeIntervalSince1970)
            }
        } else { return 0 }
    }

    func toFuzzyDate() -> FuzzyDateInput {
        return FuzzyDateInput(
            year: GraphQLNullable<Int>(integerLiteral: self.year),
            month: GraphQLNullable<Int>(integerLiteral: self.month),
            day: GraphQLNullable<Int>(integerLiteral: self.day)
        )
    }
}

extension Int {
    func minutesToDays() -> Double {
        return Double(self) / 1440
    }
    
    func toFuzzyDateInt() -> FuzzyDateInt? {
        if self <= 9999 {
            return self * 10000
        } else if self <= 999999 {
            return self * 100
        } else if self <= 99999999 {
            return self
        } else {
            return nil
        }
    }
}

extension TimeInterval {
    // still thinking why Apple doesn't support this by default :/
    func formatted(units: NSCalendar.Unit, unitsStyle: DateComponentsFormatter.UnitsStyle) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = unitsStyle
        return formatter.string(from: self)
    }
}

extension FuzzyDateFragment {

    func formatted() -> String? {
        let year = self.year ?? 1970
        guard let month = self.month else { return nil }
        guard let day = self.day else { return nil }
        if let date = date(year: year, month: month, day: day) {
            if year == 1970 {
                let dateFormatter = DateFormatter()
                dateFormatter.setLocalizedDateFormatFromTemplate("MMMM dd")
                return dateFormatter.string(from: date)
            }
            return date.formatted(date: .abbreviated, time: .omitted)
        } else { return nil }
    }

    func isEqual(_ fuzzyDate: FuzzyDateInput?) -> Bool {
        guard self.day != fuzzyDate?.day.unwrapped else { return false }
        guard self.month != fuzzyDate?.month.unwrapped else { return false }
        guard self.year != fuzzyDate?.year.unwrapped else { return false }
        return true
    }
    
    func isoString() -> String {
        return "\(year ?? 3000)\(month ?? 12)\(day ?? 31)"
    }
}

func date(year: Int, month: Int, day: Int) -> Date? {
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.day = day
    dateComponents.month = month
    return Calendar(identifier: .gregorian).date(from: dateComponents)
}
