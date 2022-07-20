//
//  DateUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import Foundation

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
    
    var season: MediaSeason {
        switch self.month {
        case 1, 2, 12:
            return MediaSeason.winter
        case 3, 4, 5:
            return MediaSeason.spring
        case 6, 7, 8:
            return MediaSeason.summer
        case 9, 10, 11:
            return MediaSeason.fall
        default:
            return MediaSeason.spring
        }
    }
    
    func toFuzzyDate() -> FuzzyDateInput {
        return FuzzyDateInput(year: self.year, month: self.month, day: self.day)
    }
}

extension Int {
    
    /// Converts miliseconds to days, hours or minutes.
    /// Depending if there are enough days, hours or minutes.
    /// Eg. If days >= 1 returns number of days + " days"
    func timestampToDaysOrHoursOrMinutes() -> String {
        let days = self / 86400
        if days >= 1 { return "\(days) days" }
        else {
            let hours = self / 3600
            if hours >= 1 { return "\(hours) h" }
            else {
                let minutes = (self % 3600) / 60
                return "\(minutes) min"
            }
        }
    }
}

extension FuzzyDate {
    
    func formatted() -> String {
        guard (self.year != nil) else { return "Unknown" }
        guard (self.month != nil) else { return "Unknown" }
        guard (self.day != nil) else { return "Unknown" }
        if let date = date(year: self.year!, month: self.month!, day: self.day!) {
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
