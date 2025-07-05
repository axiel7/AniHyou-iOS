//
//  CalendarAnimeView.swift
//  AniHyou
//
//  Created by Axel Lopez on 07/01/2023.
//

import SwiftUI

struct CalendarAnimeView: View {

    @State private var weekday = Date.now.weekday
    @State private var onMylist = false

    var body: some View {
        VStack {
            Picker("Weekday", selection: $weekday) {
                ForEach(1...7, id: \.self) { day in
                    Text(Calendar.current.veryShortSymbol(weekday: day))
                }
            }
            .pickerStyle(.segmented)
            .padding()

            Spacer()
            ScrollView(.vertical) {
                WeekAnimeListView(weekday: weekday, onMyList: onMylist)
            }
        }
        .navigationBarTitle("Calendar")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu(
                    content: {
                        Button(action: { onMylist.toggle() }, label: {
                            if onMylist {
                                Label("On my list", systemImage: "checkmark")
                            } else {
                                Text("On my list")
                            }
                        })
                    },
                    label: {
                        let icon = if #available(iOS 26, *) {
                            "line.3.horizontal.decrease"
                        } else {
                            "line.3.horizontal.decrease.circle"
                        }
                        Label("Filter", systemImage: icon)
                    }
                )
                .tint(nil)
            }
        }
    }
}

struct WeekAnimeListView: View {

    let weekday: Int
    let onMyList: Bool
    @StateObject private var viewModel = CalendarViewModel()

    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15))
    ]

    var body: some View {
        LazyVGrid(columns: gridColumns) {
            ForEach(viewModel.weeklyAnimes, id: \.mediaId) { item in
                if let media = item.media {
                    NavigationLink(destination: MediaDetailsView(mediaId: item.mediaId)) {
                        VListItemView(
                            title: media.title?.userPreferred ?? "",
                            imageUrl: media.coverImage?.large,
                            nextEpisode: item.episode,
                            airingAt: item.airingAt,
                            status: media.mediaListEntry?.status?.value
                        )
                        .mediaContextMenu(
                            mediaId: item.mediaId,
                            mediaType: .anime,
                            mediaListStatus: media.mediaListEntry?.status?.value
                        )
                    }
                    .buttonStyle(.plain)
                }
            }

            if viewModel.hasNextPage {
                ProgressView()
                    .task {
                        await viewModel.getAiringAnimes(weekday: weekday, onMyList: onMyList)
                    }
            }
        }
        .onChange(of: weekday) {
            Task {
                await viewModel.getAiringAnimes(
                    weekday: weekday,
                    onMyList: onMyList,
                    resetPage: true
                )
            }
        }
        .onChange(of: onMyList) {
            Task {
                await viewModel.getAiringAnimes(
                    weekday: weekday,
                    onMyList: onMyList,
                    resetPage: true
                )
            }
        }
    }
}

#Preview {
    CalendarAnimeView()
}
