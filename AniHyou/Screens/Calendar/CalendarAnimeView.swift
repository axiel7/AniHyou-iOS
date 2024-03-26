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
                Text("monday_short").tag(2)
                Text("tuesday_short").tag(3)
                Text("wednesday_short").tag(4)
                Text("thursday_short").tag(5)
                Text("friday_short").tag(6)
                Text("saturday_short").tag(7)
                Text("sunday_short").tag(1)
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
                    label: { Label("Filter", systemImage: "line.3.horizontal.decrease.circle") }
                )
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
            ForEach(viewModel.weeklyAnimes, id: \.?.mediaId) {
                if let item = $0, let media = item.media {
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
                    .onAppear {
                        viewModel.getAiringAnimes(weekday: weekday, onMyList: onMyList)
                    }
            }
        }
        .onChange(of: weekday) { day in
            viewModel.getAiringAnimes(weekday: day, onMyList: onMyList, resetPage: true)
        }
        .onChange(of: onMyList) { onList in
            viewModel.getAiringAnimes(weekday: weekday, onMyList: onList, resetPage: true)
        }
    }
}

#Preview {
    CalendarAnimeView()
}
