//
//  AiringWidget.swift
//  Airing Widget
//
//  Created by Axel Lopez on 01/05/2023.
//

import WidgetKit
import SwiftUI
import AniListAPI

struct AiringProvider: TimelineProvider {
    func placeholder(in context: Context) -> AiringEntry {
        AiringEntry(
            animeList: [],
            date: Date(),
            placeholderText: "Your airing anime list should appear here",
            widgetSize: context.displaySize
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (AiringEntry) -> Void) {
        getAnimeTimeline(context: context, completion: {
            if let entry = $0.entries.first {
                completion(entry)
            } else {
                completion(placeholder(in: context))
            }
        })
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<AiringEntry>) -> Void) {
        getAnimeTimeline(context: context, completion: completion)
    }
    
    func getAnimeTimeline(context: Context, completion: @escaping (Timeline<AiringEntry>) -> Void) {
        let now = Date.now
        let userId = UserDefaults(suiteName: ANIHYOU_GROUP)?.integer(forKey: USER_ID_KEY) ?? 0

        if userId == 0 {
            let entry = AiringEntry(
                animeList: [],
                date: now,
                placeholderText: "Login to use this widget",
                widgetSize: context.displaySize
            )
            completion(Timeline(entries: [entry], policy: .never))
        }

        // update every 12h
        var nextUpdateDate = Calendar.current.date(byAdding: .hour, value: 12, to: now)!

        Task {
            do {
                let result = try await Network.shared.apollo.fetch(
                    query: UserCurrentAnimeListQuery(
                        userId: .some(Int32(userId)),
                        sort: .some([.case(.updatedTimeDesc)])
                    ),
                    cachePolicy: .networkOnly
                )
                if let mediaList = result.data?.page?.mediaList {
                    var tempList = transformToAiringAnimeList(mediaList)
                    
                    let maxItems = context.family.maxMediaListItems
                    tempList = Array(tempList.prefix(maxItems))

                    let entry = AiringEntry(
                        animeList: tempList,
                        date: nextUpdateDate,
                        placeholderText: nil,
                        widgetSize: context.displaySize
                    )
                    let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
                    completion(timeline)
                }
            } catch {
                print(error)
                nextUpdateDate = Calendar.current.date(byAdding: .hour, value: 1, to: now)!
                let entry = AiringEntry(
                    animeList: [],
                    date: nextUpdateDate,
                    placeholderText: "Error updating",
                    widgetSize: context.displaySize
                )
                completion(Timeline(entries: [entry], policy: .after(nextUpdateDate)))
            }
        }
    }
    
    func transformToAiringAnimeList(_ list: [UserCurrentAnimeListQuery.Data.Page.MediaList?]
    ) -> [UserCurrentAnimeListQuery.Data.Page.MediaList?] {
        list
            .filter { $0?.media?.status == .releasing && $0?.media?.nextAiringEpisode != nil }
            .sorted {
                $0?.media?.nextAiringEpisode?.timeUntilAiring ?? 0
                < $1?.media?.nextAiringEpisode?.timeUntilAiring ?? 0
            }
    }
}

struct AiringEntry: BaseEntry {
    let animeList: [UserCurrentAnimeListQuery.Data.Page.MediaList?]
    var date: Date
    var placeholderText: String?
    var widgetSize: CGSize
}

struct AiringWidgetEntryView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    @AppStorage(ACCENT_COLOR_KEY, store: UserDefaults(suiteName: ANIHYOU_GROUP)) private var accentColor = ANIHYOU_COLOR
    var tintColor: Color {
        Color(hex: accentColor) ?? .accentColor
    }
    
    var entry: AiringProvider.Entry

    var aligment: Alignment {
        if entry.placeholderText != nil || entry.animeList.isEmpty {
            return .center
        } else {
            if entry.animeList.count >= family.maxMediaListItems {
                return .center
            } else {
                return .top
            }
        }
    }
    var paddingLenght: CGFloat? {
        if aligment == .top {
            return nil
        } else {
            return 0
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            content
        }//:VStack
        .containerBackground(.background, for: .widget)
        .padding(.vertical, paddingLenght)
        .frame(height: entry.widgetSize.height, alignment: aligment)
        .tint(tintColor)
    }
    
    @ViewBuilder
    var content: some View {
        if let placeholder = entry.placeholderText {
            Text(placeholder)
                .multilineTextAlignment(.center)
        } else if entry.animeList.isEmpty {
            Text("No airing anime in your list\n(*´-`)")
                .multilineTextAlignment(.center)
        } else {
            if family == .systemSmall {
                smallContent
            } else {
                mediumLargeContent
            }
        }
    }
    
    @ViewBuilder
    var mediumLargeContent: some View {
        ForEach(Array(entry.animeList.enumerated()), id: \.element?.mediaId) { index, item in
            if let item, let schedule = item.media?.nextAiringEpisode {
                Link(destination: URL(string: "anihyou://media/\(item.mediaId)")!) {
                    Text(item.media?.title?.userPreferred ?? "")
                        .font(.system(size: 14))
                        .lineLimit(1)
                        .padding(.horizontal)
                        .frame(width: entry.widgetSize.width, alignment: .leading)
                    
                    AiringText(
                        episode: schedule.episode,
                        airingAt: schedule.airingAt,
                        airingColor: tintColor
                    )
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .padding(.horizontal)
                    .frame(width: entry.widgetSize.width, alignment: .leading)
                    
                    if (index + 1) < entry.animeList.count {
                        Divider()
                            .padding(.leading)
                    }
                }//:Link
            }
        }//:ForEach
    }
    
    @ViewBuilder
    var smallContent: some View {
        if
            let item = entry.animeList.first,
            let item, // swift wtf ↑
            let schedule = item.media?.nextAiringEpisode
        {
            VStack(alignment: .leading, spacing: 8) {
                AiringText(
                    episode: schedule.episode,
                    airingAt: schedule.airingAt,
                    airingColor: tintColor
                )
                .font(.headline)
                
                Text(item.media?.title?.userPreferred ?? "")
                    .font(.subheadline)
            }//:VStack
            .allowsTightening(true)
            .multilineTextAlignment(.leading)
            .padding(.all, 0)
        }
    }
}

struct AiringWidget: Widget {
    let kind: String = AIRING_WIDGET_KIND

    var body: some WidgetConfiguration {

        StaticConfiguration(kind: kind, provider: AiringProvider()) { entry in
            AiringWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Airing Anime")
        .description("Shows the next airing animes in your list.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

#Preview(
    as: .systemLarge,
    widget: { AiringWidget() },
    timeline: {
        AiringEntry(
            animeList: [],
            date: Date(),
            placeholderText: "This is a preview",
            widgetSize: CGSize(width: 291, height: 141)
        )
    }
)
