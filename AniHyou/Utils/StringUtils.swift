//
//  StringUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import API

extension String {
    
    var htmlStripped: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

extension Int {
    
    var stringValue: String {
        return "\(self)"
    }
}
