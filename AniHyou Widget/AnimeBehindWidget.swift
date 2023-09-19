//
//  AnimeBehindWidget.swift
//  AniHyou WidgetExtension
//
//  Created by Axel Lopez on 19/09/2023.
//

import WidgetKit
import SwiftUI
import AniListAPI

struct AnimeBehindProvider: TimelineProvider {
    
    func placeholder(in context: Context) -> AnimeBehindEntry {
        AnimeBehindEntry(
            animeList: [],
            date: Date(),
            placeholderText: "Anime with unwatched episodes appear here",
            widgetSize: context.displaySize
        )
    }
    
    func getSnapshot(in context: Context, completion: @escaping (AnimeBehindEntry) -> Void) {
        getAnimeTimeline(context: context, completion: {
            if let entry = $0.entries.first {
                completion(entry)
            } else {
                completion(placeholder(in: context))
            }
        })
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<AnimeBehindEntry>) -> Void) {
        getAnimeTimeline(context: context, completion: completion)
    }
    
    func getAnimeTimeline(context: Context, completion: @escaping (Timeline<AnimeBehindEntry>) -> Void) {
        let now = Date.now
        
        let userId = UserDefaults(suiteName: ANIHYOU_GROUP)?.integer(forKey: USER_ID_KEY) ?? 0

        if userId == 0 {
            let entry = AnimeBehindEntry(
                animeList: [],
                date: now,
                placeholderText: "Login to use this widget",
                widgetSize: context.displaySize
            )
            completion(Timeline(entries: [entry], policy: .never))
        }
        
        var nextUpdateDate = Calendar.current.date(byAdding: .hour, value: 12, to: now)!
        
        Network.shared.apollo.fetch(query: UserCurrentAnimeListQuery(
            userId: .some(userId),
            sort: .some([.case(.updatedTimeDesc)])
        )) { result in
            switch result {
            case .success(let graphQLResult):
                if let mediaList = graphQLResult.data?.page?.mediaList {
                    var tempList = transformToAnimeBehindList(mediaList)
                    
                    var maxItems = 6
                    if context.family == .systemMedium {
                        maxItems = 3
                    }
                    tempList = Array(tempList.prefix(maxItems))
                    
                    let entry = AnimeBehindEntry(
                        animeList: tempList,
                        date: nextUpdateDate,
                        placeholderText: nil,
                        widgetSize: context.displaySize
                    )
                    completion(Timeline(entries: [entry], policy: .after(nextUpdateDate)))
                }
            case .failure(let error):
                nextUpdateDate = Calendar.current.date(byAdding: .hour, value: 1, to: now)!
                let entry = AnimeBehindEntry(
                    animeList: [],
                    date: nextUpdateDate,
                    placeholderText: "Error updating:\n\(error)",
                    widgetSize: context.displaySize
                )
                completion(Timeline(entries: [entry], policy: .after(nextUpdateDate)))
            }
        }
    }
    
    func transformToAnimeBehindList(_ list: [UserCurrentAnimeListQuery.Data.Page.MediaList?]
    ) -> [UserCurrentAnimeListQuery.Data.Page.MediaList?] {
        list
            .filter {
                // filter only airing anime that has episodes behind
                if let airing = $0?.media?.nextAiringEpisode {
                    return ($0?.progress ?? 0) < airing.episode - 1
                }
                return false
            }
            .sorted {
                //sort by number of episodes behind
                let diff1 = ($0?.media?.nextAiringEpisode?.episode ?? 0) - ($0?.progress ?? 0)
                let diff2 = ($1?.media?.nextAiringEpisode?.episode ?? 0) - ($1?.progress ?? 0)
                
                return diff1 > diff2
            }
    }
}

struct AnimeBehindEntry: BaseEntry {
    let animeList: [UserCurrentAnimeListQuery.Data.Page.MediaList?]
    var date: Date
    var placeholderText: String?
    var widgetSize: CGSize
}

@available(iOS 17.0, *)
struct AnimeBehindWidgetEntryView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    @AppStorage(ACCENT_COLOR_KEY, store: UserDefaults(suiteName: ANIHYOU_GROUP)) private var accentColor = ANIHYOU_COLOR
    var tintColor: Color {
        Color(hex: accentColor) ?? .accentColor
    }
    
    let entry: AnimeBehindProvider.Entry
    
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
        VStack(alignment: .leading) {
            content
        }//:VStack
        .containerBackground(.background, for: .widget)
        .padding(.vertical, paddingLenght)
        .frame(
            width: entry.widgetSize.width,
            height: entry.widgetSize.height,
            alignment: aligment
        )
        .tint(tintColor)
    }
    
    @ViewBuilder
    var content: some View {
        if let placeholder = entry.placeholderText {
            Text(placeholder)
                .multilineTextAlignment(.center)
        } else if entry.animeList.isEmpty {
            Text("Congratulations, you are up to date!\n(๑>◡<๑)")
                .multilineTextAlignment(.center)
        } else {
            ForEach(Array(entry.animeList.enumerated()), id: \.element?.id) { index, item in
                if let item, let nextAiringEpisode = item.media?.nextAiringEpisode {
                    Link(destination: URL(string: "anihyou://media/\(item.mediaId)")!) {
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(item.media?.title?.userPreferred ?? "")
                                    .font(.system(size: 14))
                                    .lineLimit(1)
                                    .padding(.horizontal)
                                
                                let episodesBehind = (nextAiringEpisode.episode - 1) - (item.progress ?? 0)
                                Text("^[\(episodesBehind) episodes](inflect: true) behind")
                                    .font(.system(size: 12))
                                    .lineLimit(1)
                                    .foregroundColor(tintColor)
                                    .padding(.horizontal)
                                    .invalidatableContent()
                            }
                            Spacer()
                            Button("+1", intent: SetProgress(
                                mediaId: item.mediaId,
                                entryId: item.id,
                                progress: (item.progress ?? 0) + 1
                            ))
                            .padding(.horizontal)
                        }
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

@available(iOS 17.0, *)
struct AnimeBehindWidget: Widget {
    let kind: String = ANIME_BEHIND_WIDGET_KIND

    var body: some WidgetConfiguration {

        StaticConfiguration(kind: kind, provider: AnimeBehindProvider()) { entry in
            AnimeBehindWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Anime Behind")
        .description("Shows the animes with behind episodes in your list.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

@available(iOS 17.0, *)
#Preview {
    AnimeBehindWidgetEntryView(entry: AnimeBehindEntry(
        animeList: [],
        date: Date(),
        placeholderText: "Anime with unwatched episodes appear here",
        widgetSize: CGSize(width: 291, height: 141)
    ))
    .previewContext(WidgetPreviewContext(family: .systemMedium))
}
