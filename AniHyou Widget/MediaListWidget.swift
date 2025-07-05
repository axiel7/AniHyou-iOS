//
//  MediaListWidget.swift
//  AniHyou WidgetExtension
//
//  Created by Axel Lopez on 20/09/2023.
//

import WidgetKit
import SwiftUI
import AniListAPI

struct MediaListProvider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> MediaListEntry {
        MediaListEntry(
            animeList: [],
            date: Date(),
            placeholderText: "Your anime or manga list appear here",
            widgetSize: context.displaySize
        )
    }
    
    func snapshot(for configuration: SelectMediaTypeIntent, in context: Context) async -> MediaListEntry {
        let timeline = await getAnimeTimeline(context: context, mediaType: configuration.mediaType.value)
        if let entry = timeline.entries.first {
            return entry
        } else {
            return placeholder(in: context)
        }
    }
    
    func timeline(for configuration: SelectMediaTypeIntent, in context: Context) async -> Timeline<MediaListEntry> {
        await getAnimeTimeline(context: context, mediaType: configuration.mediaType.value)
    }
    
    func getAnimeTimeline(context: Context, mediaType: MediaType) async -> Timeline<MediaListEntry> {
        let now = Date.now
        
        let userId = UserDefaults(suiteName: ANIHYOU_GROUP)?.integer(forKey: USER_ID_KEY) ?? 0

        if userId == 0 {
            let entry = MediaListEntry(
                animeList: [],
                date: now,
                placeholderText: "Login to use this widget",
                widgetSize: context.displaySize
            )
            return Timeline(entries: [entry], policy: .never)
        }
        
        let maxItems = context.family.maxMediaListItems
        
        if let result = await MediaListRepository.getShouUserMediaList(
            userId: userId,
            mediaType: mediaType,
            statusIn: [.current, .repeating],
            sort: [.updatedTimeDesc],
            page: 1,
            perPage: 12
        ) {
            let tempList = Array(result.data.prefix(maxItems))
            let nextUpdateDate = Calendar.current.date(byAdding: .hour, value: 12, to: now)!
            let entry = MediaListEntry(
                animeList: tempList,
                date: nextUpdateDate,
                placeholderText: nil,
                widgetSize: context.displaySize
            )
            return Timeline(entries: [entry], policy: .after(nextUpdateDate))
        } else {
            let nextUpdateDate = Calendar.current.date(byAdding: .hour, value: 1, to: now)!
            let entry = MediaListEntry(
                animeList: [],
                date: nextUpdateDate,
                placeholderText: "Error updating",
                widgetSize: context.displaySize
            )
            return Timeline(entries: [entry], policy: .after(nextUpdateDate))
        }
    }
}

struct MediaListEntry: BaseEntry {
    let animeList: [ShouUserMediaList]
    var date: Date
    var placeholderText: String?
    var widgetSize: CGSize
}

struct MediaListWidgetEntryView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    @AppStorage(ACCENT_COLOR_KEY, store: UserDefaults(suiteName: ANIHYOU_GROUP)) private var accentColor = ANIHYOU_COLOR
    var tintColor: Color {
        Color(hex: accentColor) ?? .accentColor
    }
    
    let entry: MediaListProvider.Entry
    
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
            Text("Nothing in your list")
                .multilineTextAlignment(.center)
        } else {
            ForEach(Array(entry.animeList.enumerated()), id: \.element.id) { index, item in
                MediaListItemView(item: item, tintColor: tintColor)
                if (index + 1) < entry.animeList.count {
                    Divider()
                        .padding(.leading)
                }
            }//:ForEach
        }
    }
}

private struct MediaListItemView: View {
    
    let item: ShouUserMediaList
    let tintColor: Color
    
    var body: some View {
        Link(destination: URL(string: "anihyou://media/\(item.mediaId)")!) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(item.media?.title?.userPreferred ?? "")
                        .font(.system(size: 14))
                        .lineLimit(1)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("\(item.progress ?? 0)/\(item.maxProgress)")
                            .foregroundStyle(.secondary)
                            .frame(width: 40, alignment: .leading)
                        
                        if let schedule = item.media?.nextAiringEpisode {
                            AiringText(
                                episode: schedule.episode,
                                airingAt: schedule.airingAt,
                                episodesBehind: (schedule.episode - 1) - (item.progress ?? 0),
                                airingColor: tintColor
                            )
                        }
                    }
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .padding(.horizontal)
                    .invalidatableContent()
                }//:VStack
                Spacer()
                Button("+1", intent: SetProgressIntent(
                    mediaId: item.mediaId,
                    entryId: item.id,
                    progress: (item.progress ?? 0) + 1
                ))
                .padding(.horizontal)
            }//:HStack
        }//:Link
    }
}

struct MediaListWidget: Widget {
    let kind: String = MEDIA_LIST_WIDGET_KIND

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: SelectMediaTypeIntent.self,
            provider: MediaListProvider()
        ) { entry in
            MediaListWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Media List")
        .description("Quick access to your anime or manga list.")
        .supportedFamilies([.systemMedium, .systemLarge])
    }
}

#Preview(
    as: .systemMedium,
    widget: { MediaListWidget() },
    timeline: {
        MediaListEntry(
            animeList: [],
            date: Date(),
            placeholderText: "Your anime or manga list here.",
            widgetSize: CGSize(width: 291, height: 141)
        )
    }
)
