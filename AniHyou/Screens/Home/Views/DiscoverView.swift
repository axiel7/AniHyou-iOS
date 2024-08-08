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
    
    @StateObject private var viewModel = DiscoverViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading) {

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
                .padding(.top, 12)
            }//:VScrollView
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
                .scrollTargetLayoutCompat()
                .padding(.leading, 8)
            }//:HScrollView
            .scrollTargetBehaviorCompat()
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
                AnimeSeasonListView(initSeason: season.season)
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
                .padding(.leading, 14)
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
                .padding(.leading, 14)
            }//:HScrollView
            .frame(minHeight: 180)
        }//:ZStack
        .padding(.bottom)
    }
}

#Preview {
    DiscoverView()
}
