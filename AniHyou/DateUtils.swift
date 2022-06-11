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
}
