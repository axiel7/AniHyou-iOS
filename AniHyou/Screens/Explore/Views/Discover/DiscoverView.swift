//
//  DiscoverView.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import SwiftUI
import AniListAPI

// swiftlint:disable:next type_body_length
struct DiscoverView: View {
    
    @State private var viewModel = DiscoverViewModel()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading) {
                
                Text("Anime")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)

                animeCharts
                    .padding(.bottom)

                Text("Manga")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)

                mangaCharts
                    .padding(.bottom)
                
                airingNext
                
                mediaSeason(
                    season: viewModel.nowAnimeSeason,
                    media: viewModel.seasonAnimes
                )
                .task {
                    await viewModel.getSeasonAnimes()
                }
                
                mediaContent(
                    title: "Trending Anime",
                    mediaType: .anime,
                    media: viewModel.trendingAnimes,
                    headerDestination: {
                        DiscoverMediaListView(
                            viewModel: viewModel,
                            mediaType: .anime,
                            media: viewModel.trendingAnimes,
                            hasNextPage: viewModel.hasNextPageTrendingAnime,
                            loadMore: {
                                await viewModel.getTrendingAnimes(
                                    page: viewModel.pageTrendingAnime
                                )
                            }
                        )
                        .navigationTitle("Trending Anime")
                    }
                )
                .task {
                    await viewModel.getTrendingAnimes()
                }
                
                mediaSeason(
                    season: viewModel.nextAnimeSeason,
                    media: viewModel.nextSeasonAnimes
                )
                .task {
                    await viewModel.getNextSeasonAnimes()
                }
                
                mediaContent(
                    title: "Trending Manga",
                    mediaType: .manga,
                    media: viewModel.trendingManga,
                    headerDestination: {
                        DiscoverMediaListView(
                            viewModel: viewModel,
                            mediaType: .manga,
                            media: viewModel.trendingManga,
                            hasNextPage: viewModel.hasNextPageTrendingManga,
                            loadMore: {
                                await viewModel.getTrendingManga(
                                    page: viewModel.pageTrendingManga
                                )
                            }
                        )
                        .navigationTitle("Trending Manga")
                    }
                )
                .task {
                    await viewModel.getTrendingManga()
                }
                
                mediaContent(
                    title: "Newly Added Anime",
                    mediaType: .anime,
                    media: viewModel.newlyAnime,
                    headerDestination: {
                        DiscoverMediaListView(
                            viewModel: viewModel,
                            mediaType: .anime,
                            media: viewModel.newlyAnime,
                            hasNextPage: viewModel.hasNextPageNewlyAnime,
                            loadMore: {
                                await viewModel.getNewlyAnime(
                                    page: viewModel.pageNewlyAnime
                                )
                            }
                        )
                        .navigationTitle("Newly Added Anime")
                    }
                )
                .task {
                    await viewModel.getNewlyAnime()
                }
                
                mediaContent(
                    title: "Newly Added Manga",
                    mediaType: .manga,
                    media: viewModel.newlyManga,
                    headerDestination: {
                        DiscoverMediaListView(
                            viewModel: viewModel,
                            mediaType: .manga,
                            media: viewModel.newlyManga,
                            hasNextPage: viewModel.hasNextPageNewlyManga,
                            loadMore: {
                                await viewModel.getNewlyManga(
                                    page: viewModel.pageNewlyManga
                                )
                            }
                        )
                        .navigationTitle("Newly Added Manga")
                    }
                )
                .task {
                    await viewModel.getNewlyManga()
                }
            }//:VStack
            .padding(.top)
        }
        .refreshable {
            await viewModel.onRefresh()
        }
    }
    
    @ViewBuilder
    private var animeCharts: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                NavigationLink(
                    destination: MediaChartListView(
                        title: "Top 100 Anime",
                        type: .anime,
                        sort: .scoreDesc
                    )
                ) {
                    Chip(title: "Top 100") {
                        Image(systemName: "trophy.fill")
                            .foregroundStyle(.yellow)
                    }
                }
                NavigationLink(
                    destination: MediaChartListView(title: "Popular Anime", type: .anime, sort: .popularityDesc)
                ) {
                    Chip(title: "Top Popular") {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                            .foregroundStyle(.red, .blue)
                    }
                }
                NavigationLink(
                    destination: MediaChartListView(
                        title: "Upcoming Anime",
                        type: .anime,
                        sort: .popularityDesc,
                        status: .notYetReleased
                    )
                ) {
                    Chip(title: "Upcoming") {
                        Image(systemName: "clock")
                            .foregroundStyle(.mint, .yellow)
                    }
                }
                NavigationLink(destination: MediaChartListView(
                    title: "Top Movies",
                    type: .anime,
                    sort: .scoreDesc,
                    format: .movie
                )) {
                    Chip(title: "Top Movies") {
                        Image(systemName: "movieclapper")
                            .foregroundStyle(.teal)
                    }
                }
                NavigationLink(
                    destination: MediaChartListView(
                        title: "Airing Anime",
                        type: .anime,
                        sort: .scoreDesc,
                        status: .releasing
                    )
                ) {
                    Chip(title: "Airing") {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                            .foregroundStyle(.teal, .indigo)
                    }
                }
            }
            .buttonStyle(.plain)
            .padding(.horizontal)
        }
    }

    @ViewBuilder
    private var mangaCharts: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                NavigationLink(
                    destination: MediaChartListView(title: "Top 100 Manga", type: .manga, sort: .scoreDesc)
                ) {
                    Chip(title: "Top 100") {
                        Image(systemName: "trophy.fill")
                            .foregroundStyle(.orange)
                    }
                }
                NavigationLink(
                    destination: MediaChartListView(title: "Popular Manga", type: .manga, sort: .popularityDesc)
                ) {
                    Chip(title: "Top Popular") {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                            .foregroundStyle(.blue, .red)
                    }
                }
                NavigationLink(
                    destination: MediaChartListView(
                        title: "Upcoming Manga",
                        type: .manga,
                        sort: .popularityDesc,
                        status: .notYetReleased
                    )
                ) {
                    Chip(title: "Upcoming") {
                        Image(systemName: "clock")
                            .foregroundStyle(.yellow, .mint)
                    }
                }
                NavigationLink(
                    destination: MediaChartListView(
                        title: "Publishing Manga",
                        type: .manga,
                        sort: .scoreDesc,
                        status: .releasing
                    )
                ) {
                    Chip(title: "Publishing") {
                        Image(systemName: "pencil.line")
                            .foregroundStyle(.teal, .indigo)
                    }
                }
            }
            .buttonStyle(.plain)
            .padding(.horizontal)
        }
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
                        ForEach(viewModel.airingOnMyList, id: \.id) { item in
                            NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                                AiringMediaHorizontalItemView(
                                    title: item.title?.userPreferred,
                                    imageUrl: item.coverImage?.large,
                                    meanScore: item.meanScore,
                                    nextEpisode: item.nextAiringEpisode?.episode,
                                    airingAt: item.nextAiringEpisode?.airingAt,
                                    status: item.mediaListEntry?.status?.value
                                )
                                .padding(.leading, 4)
                                .frame(width: 280, alignment: .leading)
                                .mediaContextMenu(
                                    mediaId: item.id,
                                    mediaType: .anime,
                                    mediaListStatus: item.mediaListEntry?.status?.value
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    } else {
                        ForEach(viewModel.airingAnimes, id: \.mediaId) { item in
                            NavigationLink(destination: MediaDetailsView(mediaId: item.mediaId)) {
                                AiringMediaHorizontalItemView(
                                    title: item.media?.title?.userPreferred,
                                    imageUrl: item.media?.coverImage?.large,
                                    meanScore: item.media?.meanScore,
                                    nextEpisode: item.episode,
                                    airingAt: item.airingAt,
                                    status: item.media?.mediaListEntry?.status?.value
                                )
                                .padding(.leading, 4)
                                .frame(width: 280, alignment: .leading)
                                .mediaContextMenu(
                                    mediaId: item.mediaId,
                                    mediaType: .anime,
                                    mediaListStatus: item.media?.mediaListEntry?.status?.value
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }//:HStack
                .scrollTargetLayout()
                .padding(.leading)
            }//:HScrollView
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            .frame(height: 145)
            .task {
                if airingOnMyList {
                    await viewModel.getAiringOnMyList()
                } else {
                    await viewModel.getAiringAnimes()
                }
            }
        }//:ZStack
        Divider()
    }
    
    @ViewBuilder
    func mediaSeason(
        season: AnimeSeason,
        media: [SeasonalAnimeQuery.Data.Page.Medium]
    ) -> some View {
        HStack(alignment: .center) {
            Group {
                Text(season.season.localizedName) +
                Text(" \(season.year.stringValue)")
            }
            .font(.title2)
            .bold()
            Spacer()
            NavigationLink("See All") {
                AnimeSeasonListView(initSeason: season.season, initYear: season.year)
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
        ZStack {
            if media.count == 0 {
                ProgressView()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(media, id: \.id) { item in
                        NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                            VListItemView(
                                title: item.title?.userPreferred ?? "",
                                imageUrl: item.coverImage?.large,
                                meanScore: item.meanScore,
                                status: item.mediaListEntry?.status?.value
                            )
                            .padding(.trailing, 4)
                            .mediaContextMenu(
                                mediaId: item.id,
                                mediaType: .anime,
                                mediaListStatus: item.mediaListEntry?.status?.value
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }//:HStack
                .padding(.leading, 18)
            }//:HScrollView
            .frame(minHeight: 180)
        }//:ZStack
        Divider()
    }
    
    @ViewBuilder
    func mediaContent(
        title: LocalizedStringKey,
        mediaType: MediaType,
        media: [MediaSortedQuery.Data.Page.Medium],
        headerDestination: () -> some View
    ) -> some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.title2)
                .bold()
            Spacer()
            NavigationLink("See All", destination: headerDestination)
        }
        .padding(.horizontal)
        .padding(.top, 8)
        ZStack {
            if media.count == 0 {
                ProgressView()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(media, id: \.id) { item in
                        NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                            VListItemView(
                                title: item.title?.userPreferred ?? "",
                                imageUrl: item.coverImage?.large,
                                meanScore: item.meanScore,
                                status: item.mediaListEntry?.status?.value
                            )
                            .padding(.trailing, 4)
                            .mediaContextMenu(
                                mediaId: item.id,
                                mediaType: mediaType,
                                mediaListStatus: item.mediaListEntry?.status?.value
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }//:HStack
                .padding(.leading, 18)
            }//:HScrollView
            .frame(minHeight: 180)
        }//:ZStack
        .padding(.bottom)
    }
}

#Preview {
    NavigationStack {
        DiscoverView()
    }
// swiftlint:disable:next file_length
}
