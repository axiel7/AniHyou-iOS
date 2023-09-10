//
//  AniHyou_Widget.swift
//  AniHyou Widget
//
//  Created by Axel Lopez on 01/05/2023.
//

import WidgetKit
import SwiftUI
import AniListAPI

// swiftlint:disable void_return
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {

        SimpleEntry(
            date: Date(),
            animeList: [],
            placeholderText: "Your anime list here",
            widgetSize: context.displaySize,
            widgetFamily: context.family
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(
            date: Date(),
            animeList: [],
            placeholderText: "Your anime list here",
            widgetSize: context.displaySize,
            widgetFamily: context.family
        )
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let date = Date()
        let userId = UserDefaults(suiteName: ANIHYOU_GROUP)?.integer(forKey: USER_ID_KEY) ?? 0

        if userId == 0 {
            let entry = SimpleEntry(
                date: date,
                animeList: [],
                placeholderText: "Login to use this widget",
                widgetSize: context.displaySize,
                widgetFamily: context.family
            )
            completion(Timeline(entries: [entry], policy: .never))
        }

        //update interval
        var nextUpdateDate = Calendar.current.date(byAdding: .hour, value: 12, to: date)!

        Network.shared.apollo.fetch(query: UserCurrentAnimeListQuery(userId: .some(userId))) { result in
            switch result {
            case .success(let graphQLResult):
                if let mediaList = graphQLResult.data?.page?.mediaList {
                    var tempList = mediaList.sorted(by: { item1, item2 in
                        item1?.media?.nextAiringEpisode?.timeUntilAiring ?? 0
                        < item2?.media?.nextAiringEpisode?.timeUntilAiring ?? 0
                    })
                    tempList.removeAll(where: { item in item?.media?.status != .releasing })

                    var maxItems = 6
                    if context.family == .systemMedium {
                        maxItems = 3
                    }
                    tempList = Array(tempList.prefix(maxItems))

                    let entry = SimpleEntry(
                        date: nextUpdateDate,
                        animeList: tempList,
                        placeholderText: nil,
                        widgetSize: context.displaySize,
                        widgetFamily: context.family
                    )
                    let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
                    completion(timeline)
                }
            case .failure(let error):
                print(error)
                nextUpdateDate = Calendar.current.date(byAdding: .hour, value: 1, to: date)!
                let entry = SimpleEntry(
                    date: nextUpdateDate,
                    animeList: [],
                    placeholderText: "Error updating",
                    widgetSize: context.displaySize,
                    widgetFamily: context.family
                )
                completion(Timeline(entries: [entry], policy: .after(nextUpdateDate)))
            }
        }
    }
}
// swiftlint:enable void_return

struct SimpleEntry: TimelineEntry {
    let date: Date
    let animeList: [UserCurrentAnimeListQuery.Data.Page.MediaList?]
    let placeholderText: String?
    let widgetSize: CGSize
    let widgetFamily: WidgetFamily
}

// swiftlint:disable type_name
struct AniHyou_WidgetEntryView: View {
    var entry: Provider.Entry

    var aligment: Alignment {
        if entry.placeholderText != nil || entry.animeList.isEmpty {
            return .center
        } else {
            if entry.widgetFamily == .systemMedium && entry.animeList.count >= 3 {
                return .center
            } else {
                return .top
            }
        }
    }

    var body: some View {
        ZStack {
            Color("WidgetBackground")
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                if let placeholder = entry.placeholderText {
                    Text(placeholder)
                } else if entry.animeList.isEmpty {
                    Text("No airing animes")
                } else {
                    ForEach(Array(entry.animeList.enumerated()), id: \.element?.mediaId) { index, item in
                        if let item {
                            if let nextAiringEpisode = item.media?.nextAiringEpisode {
                                Link(destination: URL(string: "anihyou://media/\(item.mediaId)")!) {
                                    Text(item.media?.title?.userPreferred ?? "")
                                        .font(.system(size: 14))
                                        .lineLimit(1)
                                        .padding(.horizontal)
                                        .frame(width: entry.widgetSize.width, alignment: .leading)

                                    HStack(spacing: 1) {
                                        let airingDate = Date(
                                            timeIntervalSince1970: Double(nextAiringEpisode.airingAt)
                                        )
                                        if airingDate > Date.now {
                                            Text("Ep \(nextAiringEpisode.episode) airing in ") +
                                            Text(airingDate, style: .relative)
                                        } else {
                                            Text("Ep \(nextAiringEpisode.episode) aired at ") +
                                            Text(airingDate, style: .time)
                                        }
                                    }
                                    .font(.system(size: 12))
                                    .lineLimit(1)
                                    .foregroundColor(.accentColor)
                                    .padding(.horizontal)
                                    .frame(width: entry.widgetSize.width, alignment: .leading)

                                    if (index + 1) < entry.animeList.count {
                                        Divider()
                                            .padding(.leading)
                                            .padding(.vertical, 8)
                                    }
                                }//:Link
                            }
                        }
                    }
                }
            }//:VStack
            .padding(.vertical)
            .frame(height: entry.widgetSize.height, alignment: aligment)
        }//:ZStack
    }
}

struct AniHyou_Widget: Widget {
    let kind: String = "AniHyou_Widget"

    var body: some WidgetConfiguration {

        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            AniHyou_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Airing Anime")
        .description("Shows the next airing animes in your list.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

struct AniHyou_Widget_Previews: PreviewProvider {
    static var previews: some View {
        let entry = SimpleEntry(
            date: Date(),
            animeList: [],
            placeholderText: "This is a preview",
            widgetSize: CGSize(width: 291, height: 141),
            widgetFamily: .systemLarge
        )
        AniHyou_WidgetEntryView(entry: entry)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
// swiftlint:enable type_name
