//
//  SearchControl.swift
//  AniHyou WidgetExtension
//
//  Created by Axel Lopez on 19/06/2024.
//

import AppIntents
import SwiftUI
import WidgetKit

@available(iOSApplicationExtension 18.0, *)
struct SearchControl: ControlWidget {
    static let kind: String = "com.axiel7.AniHyou.Search"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetButton(action: SetProgressIntent()) {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
        .displayName("Search")
        .description("Search Anime or Manga")
    }
}
