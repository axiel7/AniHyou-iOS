//
//  DateUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation
import API

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
    
    /// returns the requesed weekday timestamp (start or end of the day)
    func getThisWeekdayTimestamp(weekday: Int, isEndOfDay: Bool) -> Int {
        let diff = weekday - self.weekday
        if let weekdayDate = Calendar.current.date(byAdding: .day, value: diff, to: self) {
            if isEndOfDay {
                return Int(Calendar.current.date(byAdding: DateComponents(day: 1, second: -1), to: weekdayDate)!.timeIntervalSince1970)
            } else {
                return Int(Calendar.current.startOfDay(for: weekdayDate).timeIntervalSince1970)
            }
        }
        else { return 0 }
    }
    
    func toFuzzyDate() -> FuzzyDateInput {
        return FuzzyDateInput(year: GraphQLNullable<Int>(integerLiteral: self.year), month: GraphQLNullable<Int>(integerLiteral:  self.month), day: GraphQLNullable<Int>(integerLiteral: self.day))
    }
}

extension Int {
    
    /// Converts seconds to years, months, weeks, days, hours or minutes.
    /// Depending if there is enough time.
    /// Eg. If days greater than 1 and less than 6, returns "x days"
    func secondsToLegibleText() -> String {
        let days = self / 86400
        if days > 6 {
            let weeks = self / 604800
            if weeks > 4 {
                let months = self / 2629746
                if months > 12 {
                    let years = self / 31556952
                    return "\(years) years"
                }
                else { return "\(months) months" }
            }
            else { return "\(weeks) weeks" }
        }
        else if days >= 1 { return "\(days) days" }
        else {
            let hours = self / 3600
            if hours >= 1 { return "\(hours) h" }
            else {
                let minutes = (self % 3600) / 60
                return "\(minutes) min"
            }
        }
    }
    
    func minutesToLegibleText() -> String {
        let hours = self / 60
        if hours >= 1 {
            let minutes = self % 60
            return "\(hours) hours, \(minutes) min"
        }
        else { return "\(self) min" }
    }
    
    func timestampToDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self.timestampToDate())
    }
    
    func timestampToDate() -> Date {
        return Date(timeIntervalSince1970: Double(self))
    }
    
    func timestampIntervalSinceNow() -> Int {
        return Int(abs(self.timestampToDate().timeIntervalSinceNow))
    }
}

extension FuzzyDate {
    
    func formatted() -> String {
        let year = self.year ?? 1970
        guard (self.month != nil) else { return "Unknown" }
        guard (self.day != nil) else { return "Unknown" }
        if let date = date(year: year, month: self.month!, day: self.day!) {
            if year == 1970 {
                let dateFormatter = DateFormatter()
                dateFormatter.setLocalizedDateFormatFromTemplate("MMMM dd")
                return dateFormatter.string(from: date)
            }
            return date.formatted(date: .abbreviated, time: .omitted)
        }
        else { return "Unknown" }
    }
}

func date(year: Int, month: Int, day: Int) -> Date? {
    var dateComponents = DateComponents()
    dateComponents.year = year
    dateComponents.day = day
    dateComponents.month = month
    
    return Calendar(identifier: .gregorian).date(from: dateComponents)
}
