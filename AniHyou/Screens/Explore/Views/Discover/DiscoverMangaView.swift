//
//  DiscoverMangaView.swift
//  AniHyou
//
//  Created by Axel on 26/08/2026.
//

import SwiftUI

struct DiscoverMangaView: View {
    
    var viewModel: DiscoverMangaViewModel
    @AppStorage(BLUR_ADULT_MEDIA) private var blurAdultMedia = true
    
    var body: some View {
        mangaCharts
            .padding(.vertical)
        
        mediaContent(
            title: "Trending Manga",
            mediaType: .manga,
            media: viewModel.trendingManga,
            blurAdultMedia: blurAdultMedia,
            headerDestination: {
                DiscoverMediaListView(
                    mediaType: .manga,
                    media: viewModel.trendingManga,
                    hasNextPage: viewModel.hasNextPageTrendingManga,
                    loadMore: {
                        await viewModel.getTrendingManga()
                    }
                )
                .navigationTitle("Trending Manga")
            }
        )
        .task {
            await viewModel.getTrendingManga()
        }
        
        mediaContent(
            title: "Popular Manga",
            mediaType: .manga,
            media: viewModel.popularManga,
            blurAdultMedia: blurAdultMedia,
            headerDestination: {
                MediaChartListView(title: "Popular Manga", type: .manga, sort: .popularityDesc)
            }
        )
        .task {
            await viewModel.getPopularManga()
        }
        
        mediaContent(
            title: "Popular Manhwa",
            mediaType: .manga,
            media: viewModel.popularManhwa,
            blurAdultMedia: blurAdultMedia,
            headerDestination: {
                MediaChartListView(
                    title: "Popular Manhwa",
                    type: .manga,
                    sort: .popularityDesc,
                    country: .southKorea
                )
            }
        )
        .task {
            await viewModel.getPopularManhwa()
        }
        
        mediaContent(
            title: "Newly Added Manga",
            mediaType: .manga,
            media: viewModel.newlyManga,
            blurAdultMedia: blurAdultMedia,
            headerDestination: {
                DiscoverMediaListView(
                    mediaType: .manga,
                    media: viewModel.newlyManga,
                    hasNextPage: viewModel.hasNextPageNewlyManga,
                    loadMore: {
                        await viewModel.getNewlyManga()
                    }
                )
                .navigationTitle("Newly Added Manga")
            }
        )
        .task {
            await viewModel.getNewlyManga()
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
}

#Preview {
    DiscoverMangaView(viewModel: DiscoverMangaViewModel())
}
