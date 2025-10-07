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
        Calendar.current.date(byAdding: .day, value: 1, to: self)
    }

    var year: Int {
        Calendar(identifier: .gregorian).component(.year, from: self)
    }

    var month: Int {
        Calendar(identifier: .gregorian).component(.month, from: self)
    }

    var day: Int {
        Calendar(identifier: .gregorian).component(.day, from: self)
    }

    var weekday: Int {
        Calendar.current.component(.weekday, from: self)
    }

    var season: MediaSeason {
        switch self.month {
        case 1, 2, 12:
            .winter
        case 3, 4, 5:
            .spring
        case 6, 7, 8:
            .summer
        case 9, 10, 11:
            .fall
        default:
            .spring
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
        let calendar = Calendar.current
        let currentWeekday = calendar.component(.weekday, from: self)
        
        let diff = weekday - currentWeekday
        guard let weekdayDate = calendar.date(byAdding: .day, value: diff, to: self) else {
            return 0
        }
        
        // Truncate to midnight
        let startOfDay = calendar.startOfDay(for: weekdayDate)
        
        let resultDate: Date
        if isEndOfDay {
            // Next day midnight minus 1 second
            if let nextDay = calendar.date(byAdding: .day, value: 1, to: startOfDay) {
                resultDate = nextDay.addingTimeInterval(-1)
            } else {
                resultDate = startOfDay
            }
        } else {
            // Same day midnight minus 1 second
            resultDate = startOfDay.addingTimeInterval(-1)
        }
        
        return Int(resultDate.timeIntervalSince1970)
    }

    func toFuzzyDate() -> FuzzyDateInput {
        FuzzyDateInput(
            year: GraphQLNullable<Int32>(integerLiteral: Int32(self.year)),
            month: GraphQLNullable<Int32>(integerLiteral: Int32(self.month)),
            day: GraphQLNullable<Int32>(integerLiteral: Int32(self.day))
        )
    }
}

extension Calendar {
    func veryShortSymbol(weekday: Int) -> String {
        return veryShortWeekdaySymbols[weekday - 1]
    }
    
    func weekdaysOrderedByFirstWeekday() -> [Int] {
        let first = self.firstWeekday
        
        let all = Array(1...7)
        
        // Slice starting from firstWeekday, then wrap
        let ordered = Array(all[first-1..<all.count] + all[0..<first-1])
        return ordered
    }
}

extension Int {
    func minutesToDays() -> Double {
        Double(self) / 1440
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
        guard self.day?.toInt32() == fuzzyDate?.day.unwrapped else { return false }
        guard self.month?.toInt32() == fuzzyDate?.month.unwrapped else { return false }
        guard self.year?.toInt32() == fuzzyDate?.year.unwrapped else { return false }
        return true
    }
    
    func isNil() -> Bool {
        day == nil && month == nil && year == nil
    }
    
    func isoString() -> String {
        "\(year ?? 3000)\(month ?? 12)\(day ?? 31)"
    }
    
    func asDate() -> Date? {
        if let year, let month, let day {
            date(year: year, month: month, day: day)
        } else {
            nil
        }
    }
}

func date(year: Int, month: Int, day: Int) -> Date? {
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.day = day
    dateComponents.month = month
    return Calendar(identifier: .gregorian).date(from: dateComponents)
}
