//
//  WidgetUtils.swift
//  AniHyou WidgetExtension
//
//  Created by Axel Lopez on 20/09/2023.
//

import Foundation
import WidgetKit

extension WidgetFamily {
    var maxMediaListItems: Int {
        switch self {
        case .systemSmall:
            return 1
        case .systemMedium:
            return 3
        case .systemLarge:
            return 7
        case .systemExtraLarge:
            return 7
        case .accessoryCorner:
            return 1
        case .accessoryCircular:
            return 1
        case .accessoryRectangular:
            return 2
        case .accessoryInline:
            return 1
        @unknown default:
            return 3
        }
    }
}
