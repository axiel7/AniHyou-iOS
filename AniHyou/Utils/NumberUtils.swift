//
//  NumberUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 27/03/2024.
//

import Foundation

extension Int {

    var stringValue: String {
        return "\(self)"
    }
    
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
}
