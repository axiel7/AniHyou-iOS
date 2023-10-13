//
//  AnimesView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

// swiftlint:disable type_body_length
struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()
    @State private var showNotificationsSheet = false
    @State private var showingMediaDetails = false
    @State private var mediaId = 0

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading) {

                    airingNext

                    thisSeason

                    trendingAnime

                    nextSeason

                    trendingManga
                }//:VStack
            }//:VScrollView
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem {
                    Button(action: { showNotificationsSheet = true }, label: {
                        Label("Notifications", systemImage: viewModel.notificationCount > 0 ? "bell.badge" : "bell")
                    })
                    .onAppear {
                        viewModel.getNotificationCount()
                    }
                }
            }
            .sheet(isPresented: $showNotificationsSheet) {
                NotificationsView()
            }
            .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
        }//:NavigationStack
    }

    @ViewBuilder
    var airingNext: some View {
        @AppStorage(AIRING_ON_MY_LIST_KEY) var airingOnMyList = false

        HStack(alignment: .center) {
            Text("Airing Next")
                .font(.title2)
                .bold()
            Spacer()
            NavigationLink("See All", destination: CalendarAnimeView())
        }
        .padding(.horizontal)
        .padding(.top, 8)
        ZStack {
            if viewModel.airingAnimes.count == 0 && viewModel.airingOnMyList.count == 0 {
                Text("No anime for today\n(*´-`)")
                    .multilineTextAlignment(.center)
                    .frame(alignment: .center)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    if airingOnMyList {
                        ForEach(viewModel.airingOnMyList, id: \.?.id) {
                            if let item = $0 {
                                NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                                    AiringMediaHorizontalItemView(
                                        title: item.title?.userPreferred,
                                        imageUrl: item.coverImage?.large,
                                        meanScore: item.meanScore,
                                        nextEpisode: item.nextAiringEpisode?.episode,
                                        airingAt: item.nextAiringEpisode?.airingAt
                                    )
                                    .padding(.leading, 8)
                                    .frame(width: 280, alignment: .leading)
                                    .mediaContextMenu(
                                        mediaId: item.id,
                                        mediaType: .anime,
                                        mediaListStatus: item.mediaListEntry?.status?.value
                                    )
                                }
                            }
                        }
                    } else {
                        ForEach(viewModel.airingAnimes, id: \.?.mediaId) {
                            if let item = $0 {
                                NavigationLink(destination: MediaDetailsView(mediaId: item.mediaId)) {
                                    AiringMediaHorizontalItemView(
                                        title: item.media?.title?.userPreferred,
                                        imageUrl: item.media?.coverImage?.large,
                                        meanScore: item.media?.meanScore,
                                        nextEpisode: item.episode,
                                        airingAt: item.airingAt
                                    )
                                    .padding(.leading, 8)
                                    .frame(width: 280, alignment: .leading)
                                    .mediaContextMenu(
                                        mediaId: item.mediaId,
                                        mediaType: .anime,
                                        mediaListStatus: item.media?.mediaListEntry?.status?.value
                                    )
                                }
                            }
                        }
                    }
                }//:HStack
                .padding(.leading, 8)
            }//:HScrollView
            .frame(height: 145)
            .onAppear {
                if airingOnMyList {
                    viewModel.getAiringOnMyList()
                } else {
                    viewModel.getAiringAnimes()
                }
            }
        }//:ZStack
        Divider()
    }

    @ViewBuilder
    var thisSeason: some View {
        HStack(alignment: .center) {
            Group {
                Text(viewModel.nowAnimeSeason.season.localizedName) +
                Text(" \(viewModel.nowAnimeSeason.year)")
            }
            .font(.title2)
            .bold()
            Spacer()
            NavigationLink("See All", destination: AnimeSeasonListView(season: viewModel.nowAnimeSeason.season))
        }
        .padding(.horizontal)
        .padding(.top, 8)
        ZStack {
            if viewModel.seasonAnimes.count == 0 {
                ProgressView()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(viewModel.seasonAnimes, id: \.?.id) {
                        if let item = $0 {
                            NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                                VListItemView(
                                    title: item.title?.userPreferred ?? "",
                                    imageUrl: item.coverImage?.large,
                                    meanScore: item.meanScore
                                )
                                .padding(.trailing, 4)
                                .mediaContextMenu(
                                    mediaId: item.id,
                                    mediaType: .anime,
                                    mediaListStatus: item.mediaListEntry?.status?.value
                                )
                            }
                        }
                    }
                }//:HStack
                .padding(.leading, 14)
            }//:HScrollView
            .frame(minHeight: 180)
            .onAppear {
                viewModel.getSeasonAnimes()
            }
        }//:ZStack
        Divider()
    }

    @ViewBuilder
    var trendingAnime: some View {
        HStack(alignment: .center) {
            Text("Trending Anime")
                .font(.title2)
                .bold()
            Spacer()
            NavigationLink("See All", destination: TrendingListView(viewModel: viewModel, mediaType: .anime))
        }
        .padding(.horizontal)
        .padding(.top, 8)
        ZStack {
            if viewModel.trendingAnimes.count == 0 {
                ProgressView()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(viewModel.trendingAnimes, id: \.?.id) {
                        if let item = $0 {
                            NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                                VListItemView(
                                    title: item.title?.userPreferred ?? "",
                                    imageUrl: item.coverImage?.large,
                                    meanScore: item.meanScore
                                )
                                .padding(.trailing, 4)
                                .mediaContextMenu(
                                    mediaId: item.id,
                                    mediaType: .anime,
                                    mediaListStatus: item.mediaListEntry?.status?.value
                                )
                            }
                        }
                    }
                }//:HStack
                .padding(.leading, 14)
            }//:HScrollView
            .frame(minHeight: 180)
            .onAppear {
                viewModel.getTrendingAnimes()
            }
        }//:ZStack
        Divider()
    }

    @ViewBuilder
    var nextSeason: some View {
        HStack(alignment: .center) {
            Text("Next Season")
                .font(.title2)
                .bold()
            Spacer()
            NavigationLink("See All", destination: AnimeSeasonListView(
                season: viewModel.nextAnimeSeason.season,
                selectedYear: viewModel.nextAnimeSeason.year)
            )
        }
        .padding(.horizontal)
        .padding(.top, 8)
        ZStack {
            if viewModel.nextSeasonAnimes.count == 0 {
                ProgressView()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(viewModel.nextSeasonAnimes, id: \.?.id) {
                        if let item = $0 {
                            NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                                VListItemView(
                                    title: item.title?.userPreferred ?? "",
                                    imageUrl: item.coverImage?.large,
                                    meanScore: item.meanScore
                                )
                                .padding(.trailing, 4)
                                .mediaContextMenu(
                                    mediaId: item.id,
                                    mediaType: .anime,
                                    mediaListStatus: item.mediaListEntry?.status?.value
                                )
                            }
                        }
                    }
                }//:HStack
                .padding(.leading, 14)
            }//:HScrollView
            .frame(minHeight: 180)
            .onAppear {
                viewModel.getNextSeasonAnimes()
            }
        }//:ZStack
        Divider()
    }

    @ViewBuilder
    var trendingManga: some View {
        HStack(alignment: .center) {
            Text("Trending Manga")
                .font(.title2)
                .bold()
            Spacer()
            NavigationLink("See All", destination: TrendingListView(viewModel: viewModel, mediaType: .manga))
        }
        .padding(.horizontal)
        .padding(.top, 8)
        ZStack {
            if viewModel.trendingManga.count == 0 {
                ProgressView()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(viewModel.trendingManga, id: \.?.id) {
                        if let item = $0 {
                            NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                                VListItemView(
                                    title: item.title?.userPreferred ?? "",
                                    imageUrl: item.coverImage?.large,
                                    meanScore: item.meanScore
                                )
                                .padding(.trailing, 4)
                                .mediaContextMenu(
                                    mediaId: item.id,
                                    mediaType: .manga,
                                    mediaListStatus: item.mediaListEntry?.status?.value
                                )
                            }
                        }
                    }
                }//:HStack
                .padding(.leading, 14)
            }//:HScrollView
            .frame(minHeight: 180)
            .onAppear {
                viewModel.getTrendingManga()
            }
        }//:ZStack
        .padding(.bottom)
    }
}

#Preview {
    HomeView()
}
// swiftlint:enable type_body_length
