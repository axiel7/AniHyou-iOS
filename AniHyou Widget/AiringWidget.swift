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

        Network.shared.apollo.fetch(query: UserCurrentAnimeListQuery(
            userId: .some(userId),
            sort: .some([.case(.updatedTimeDesc)])
        )) { result in
            switch result {
            case .success(let graphQLResult):
                if let mediaList = graphQLResult.data?.page?.mediaList {
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
            case .failure(let error):
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
            .filter { $0?.media?.status == .releasing }
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
            if family == .systemMedium && entry.animeList.count >= 3 {
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
        if #available(iOS 17.0, *) {
            VStack(alignment: .leading) {
                content
            }//:VStack
            .containerBackground(.background, for: .widget)
            .padding(.vertical, paddingLenght)
            .frame(height: entry.widgetSize.height, alignment: aligment)
            .tint(tintColor)
        } else {
            ZStack {
                Color(.widgetBackground)
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    content
                }//:VStack
                .padding(.vertical, paddingLenght)
                .frame(height: entry.widgetSize.height, alignment: aligment)
                .tint(tintColor)
            }//:ZStack
        }
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
            ForEach(Array(entry.animeList.enumerated()), id: \.element?.mediaId) { index, item in
                if let item, let nextAiringEpisode = item.media?.nextAiringEpisode {
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
                        .foregroundColor(tintColor)
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
    }
}

struct AiringWidget: Widget {
    let kind: String = "AniHyou_Widget"

    var body: some WidgetConfiguration {

        StaticConfiguration(kind: kind, provider: AiringProvider()) { entry in
            AiringWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Airing Anime")
        .description("Shows the next airing animes in your list.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

#Preview {
    let entry = AiringEntry(
        animeList: [],
        date: Date(),
        placeholderText: "This is a preview",
        widgetSize: CGSize(width: 291, height: 141)
    )
    return AiringWidgetEntryView(entry: entry)
        .previewContext(WidgetPreviewContext(family: .systemLarge))
}
