//
//  SearchIntent.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/06/2024.
//

import AppIntents
import UIKit

struct OpenSearchIntent: AppIntent {
    static var title: LocalizedStringResource = "Launch AniHyou"
    static var description: IntentDescription? = IntentDescription("Opens AniHyou")
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some OpensIntent {
        if #available(iOS 18.0, *) {
            return .result(opensIntent: OpenURLIntent(URL(string: "anihyou://search")!))
        } else {
            return .result(value: true)
        }
    }
}
