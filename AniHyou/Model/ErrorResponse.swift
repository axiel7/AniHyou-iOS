//
//  ErrorResponse.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/08/2024.
//

import Foundation

struct ErrorResponse: Codable {
    let errors: [ErrorData]
    
    struct ErrorData: Codable {
        let message: String
    }
}
