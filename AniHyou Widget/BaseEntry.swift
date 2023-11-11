//
//  BaseEntry.swift
//  AniHyou WidgetExtension
//
//  Created by Axel Lopez on 19/09/2023.
//

import Foundation
import WidgetKit

protocol BaseEntry: TimelineEntry {
    var date: Date { get set }
    var placeholderText: String? { get set }
    var widgetSize: CGSize { get set }
}
