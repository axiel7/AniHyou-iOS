//
//  DiscoverView.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import SwiftUI

// swiftlint:disable:next type_body_length
struct DiscoverView: View {
    
    @StateObject private var viewModel = DiscoverViewModel()

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
                .padding(.leading, 8)
            }//:HScrollView
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
    var thisSeason: some View {
        HStack(alignment: .center) {
            Group {
                Text(viewModel.nowAnimeSeason.season.localizedName) +
                Text(" \(viewModel.nowAnimeSeason.year.stringValue)")
            }
            .font(.title2)
            .bold()
            Spacer()
            NavigationLink("See All", destination: AnimeSeasonListView(initSeason: viewModel.nowAnimeSeason.season))
        }
        .padding(.horizontal)
        .padding(.top, 8)
        ZStack {
            if viewModel.seasonAnimes.count == 0 {
                ProgressView()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(viewModel.seasonAnimes, id: \.id) { item in
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
            .task {
                await viewModel.getSeasonAnimes()
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
                    ForEach(viewModel.trendingAnimes, id: \.id) { item in
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
            .task {
                await viewModel.getTrendingAnimes()
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
                initSeason: viewModel.nextAnimeSeason.season,
                initYear: viewModel.nextAnimeSeason.year)
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
                    ForEach(viewModel.nextSeasonAnimes, id: \.id) { item in
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
            .task {
                await viewModel.getNextSeasonAnimes()
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
                    ForEach(viewModel.trendingManga, id: \.id) { item in
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
                                mediaType: .manga,
                                mediaListStatus: item.mediaListEntry?.status?.value
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }//:HStack
                .padding(.leading, 14)
            }//:HScrollView
            .frame(minHeight: 180)
            .task {
                await viewModel.getTrendingManga()
            }
        }//:ZStack
        .padding(.bottom)
    }
}

#Preview {
    DiscoverView()
}
