//
//  NumberUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 27/03/2024.
//

import Foundation

extension Int {

    var stringValue: String {
        "\(self)"
    }
    
    // MARK: - helper extension functions to use with nullable receiver
    
    func minus(_ number: Int?) -> Int? {
        if let number {
            self - number
        } else {
            nil
        }
    }
    
    func plus(_ number: Int?) -> Int? {
        if let number {
            self + number
        } else {
            nil
        }
    }
    
    func div(_ number: Int?) -> Int? {
        if let number {
            self / number
        } else {
            nil
        }
    }
    
    func toDouble() -> Double {
        Double(self)
    }
}

extension Int? {
    var isGreaterThanZero: Bool {
        guard let self else { return false }
        return self > 0
    }
}
