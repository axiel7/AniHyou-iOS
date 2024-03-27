//
//  StringUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import Foundation
import SwiftUI
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
    
    public func localized(with arguments: [CVarArg]) -> String {
        return String(format: NSLocalizedString(self, comment: ""), locale: nil, arguments: arguments)
    }
}

extension [LocalizedStringKey] {
    // thanks Apple, spent 2 days trying to join localized strings
    func joined(separator: LocalizedStringKey = "") -> Text {
        return self.reduce(Text("")) {
            if $1 == self.first {
                $0 + Text($1)
            } else {
                $0 + Text(separator) + Text($1)
            }
        }
    }
}
