//
//  LaunchAppWidget.swift
//  AniHyouShou Widget
//
//  Created by Axel Lopez on 4/12/25.
//

import WidgetKit
import SwiftUI

private struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> LaunchEntry {
        LaunchEntry(date: Date.now)
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (LaunchEntry) -> Void) {
        completion(LaunchEntry(date: Date.now))
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<LaunchEntry>) -> Void) {
        completion(Timeline(entries: [LaunchEntry(date: Date.now)], policy: .never))
    }
}

private struct LaunchEntry: TimelineEntry {
    var date: Date
}

private struct LaunchAppWidgetView: View {
    private let launchURL = URL(string: "anihyou://launch")!
    
    var body: some View {
        Link(destination: launchURL) {
            Image("AniHyou_frg")
                .resizable()
                .scaledToFit()
                .padding(2)
                .background(.thinMaterial, in: .circle)
        }
        .containerBackground(.background, for: .widget)
    }
}

struct LaunchAppWidget: Widget {
    
    let kind = "AniHyou_Launch_App_Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()
        ) { _ in
            LaunchAppWidgetView()
        }
        .configurationDisplayName("Launch AniHyou")
        .supportedFamilies([.accessoryCircular])
    }
}

#Preview(
    as: .accessoryCircular,
    widget: { LaunchAppWidget() },
    timeline: { LaunchEntry(date: Date.now) }
)
