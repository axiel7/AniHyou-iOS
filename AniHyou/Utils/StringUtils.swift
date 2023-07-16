//
//  StringUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import AniListAPI

extension String {

    var htmlStripped: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }

    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }

    func htmlToAttributedString() -> NSAttributedString? {
        do {
            return try NSAttributedString(
                data: self.data(using: .unicode)!,
                options: [.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil
            )
        } catch {
            print(error)
            return nil
        }
    }

    init(swiftLintMultiline strings: String...) {
        self = strings.reduce("", +)
    }
}

extension Int {

    var stringValue: String {
        return "\(self)"
    }
}
