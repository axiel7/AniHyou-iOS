//
//  AniHyou_Widget.swift
//  AniHyou Widget
//
//  Created by Axel Lopez on 01/05/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(
            date: Date(),
            animeList: [],
            placeholderText: "Your anime list here"
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(
            date: Date(),
            animeList: [],
            placeholderText: "Your anime list here"
        )
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let date = Date()
        let userId = UserDefaults(suiteName: "group.com.axiel7.AniHyou")?.integer(forKey: USER_ID_KEY) ?? 0
        
        //update interval
        let nextUpdateDate = Calendar.current.date(byAdding: .hour, value: 12, to: date)!
        
        Network.shared.apollo.fetch(query: UserCurrentAnimeListQuery(userId: .some(userId))) { result in
            switch result {
            case .success(let graphQLResult):
                if let mediaList = graphQLResult.data?.page?.mediaList {
                    var tempList = mediaList.sorted(by: { item1, item2 in item1?.media?.nextAiringEpisode?.timeUntilAiring ?? 0 < item2?.media?.nextAiringEpisode?.timeUntilAiring ?? 0
                    })
                    tempList.removeAll(where: { item in item?.media?.status != .releasing })
                    tempList = Array(tempList.prefix(5))
                    
                    let entry = SimpleEntry(
                        date: nextUpdateDate,
                        animeList: tempList,
                        placeholderText: nil
                    )
                    let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
                    completion(timeline)
                }
            case .failure(let error):
                print(error)
                completion(Timeline(entries: [], policy: .after(nextUpdateDate)))
            }
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let animeList: [UserCurrentAnimeListQuery.Data.Page.MediaList?]
    let placeholderText: String?
}

struct AniHyou_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                if entry.placeholderText != nil {
                    Text(entry.placeholderText!)
                }
                else if entry.animeList.isEmpty {
                    Text("No airing animes")
                }
                else {
                    ForEach(entry.animeList, id: \.?.mediaId) {
                        if let item = $0 {
                            if let nextAiringEpisode = item.media?.nextAiringEpisode {
                                Link(destination: URL(string: "anihyou://media/\(item.mediaId)")!) {
                                    Text(item.media?.title?.userPreferred ?? "")
                                        .font(.system(size: 14))
                                        .lineLimit(1)
                                        .padding(.horizontal)
                                    
                                    Text("Ep \(nextAiringEpisode.episode) airing in \(calculateAiringTime(airingAt: nextAiringEpisode.airingAt))")
                                        .font(.system(size: 12))
                                        .lineLimit(1)
                                        .padding(.horizontal)
                                        .foregroundColor(.accentColor)
                                    Divider()
                                        .padding(.leading)
                                }
                            }
                        }
                    }
                }
            }//:VStack
        }//:ZStack
    }
    
    func calculateAiringTime(airingAt: Int?) -> String {
        guard airingAt != nil else {
            return "??"
        }
        let currentTime = Int(Date.now.timeIntervalSince1970 * 1)
        return ((airingAt!) - currentTime).secondsToLegibleText()
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
        AniHyou_WidgetEntryView(entry: SimpleEntry(date: Date(), animeList: [], placeholderText: "This is a preview"))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
