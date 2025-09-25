//
//  OverviewStatsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/03/2023.
//

import SwiftUI
import AniListAPI

struct OverviewStatsView: View {

    let userId: Int
    let mediaType: MediaType
    @State private var viewModel = OverviewStatsViewModel()
    @State private var scoreStatType: StatDistributionType = .titles
    @State private var lengthStatType: StatDistributionType = .titles
    @State private var releaseYearStatType: StatDistributionType = .titles
    @State private var startYearStatType: StatDistributionType = .titles

    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.isLoading {
                HorizontalProgressView()
                Spacer()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack {
                        Divider()
                        if mediaType == .anime && viewModel.animeStats != nil {
                            mainAnimeStats
                        } else if mediaType == .manga && viewModel.mangaStats != nil {
                            mainMangaStats
                        }
                        Divider()
                    }//:VStack
                    .padding(.horizontal)
                    .frame(height: 75)
                }//:HScrollView

                Text("Score distribution")
                    .font(.title3)
                    .padding(.horizontal)
                    .padding(.top)
                Picker("Distribution type", selection: $scoreStatType) {
                    Text("Titles Count").tag(StatDistributionType.titles)
                    if mediaType == .anime {
                        Text("Hours Watched").tag(StatDistributionType.time)
                    } else if mediaType == .manga {
                        Text("Chapters Read").tag(StatDistributionType.time)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                VerticalBarsStatsView(
                    stats: scoreStatType == .titles ? viewModel.scoreStatsCount : viewModel.scoreStatsTime
                )
                
                Group {
                    if mediaType == .anime {
                        Text("Episode Count")
                    } else if mediaType == .manga {
                        Text("Chapter Count")
                    }
                }
                .font(.title3)
                .padding(.horizontal)
                .padding(.top)
                Picker("Distribution type", selection: $lengthStatType) {
                    ForEach(StatDistributionType.allCases, id: \.self) {
                        Text($0.localizedName)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                let lengthStats = switch lengthStatType {
                case .titles:
                    viewModel.lengthStatsCount
                case .time:
                    viewModel.lengthStatsTime
                case .score:
                    viewModel.lengthStatsScore
                }
                VerticalBarsStatsView(stats: lengthStats)

                Text("Format Distribution")
                    .font(.title3)
                    .padding(.horizontal)
                    .padding(.top)
                HorizontalBarStatsView(stats: viewModel.formatsDistribution)

                Text("Status Distribution")
                    .font(.title3)
                    .padding(.horizontal)
                    .padding(.top)
                HorizontalBarStatsView(stats: viewModel.statusDistribution)
                
                Text("Country Distribution")
                    .font(.title3)
                    .padding(.horizontal)
                    .padding(.top)
                HorizontalBarStatsView(stats: viewModel.countryDistribution)
                
                Text("Release Year")
                    .font(.title3)
                    .padding(.horizontal)
                    .padding(.top)
                Picker("Distribution type", selection: $releaseYearStatType) {
                    ForEach(StatDistributionType.allCases, id: \.self) {
                        Text($0.localizedName)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                let releaseYearStats = switch releaseYearStatType {
                case .titles:
                    viewModel.releaseYearStatsCount
                case .time:
                    viewModel.releaseYearStatsTime
                case .score:
                    viewModel.releaseYearStatsScore
                }
                VerticalBarsStatsView(stats: releaseYearStats)
                
                Group {
                    if mediaType == .anime {
                        Text("Watch Year")
                    } else if mediaType == .manga {
                        Text("Read Year")
                    }
                }
                .font(.title3)
                .padding(.horizontal)
                .padding(.top)
                Picker("Distribution type", selection: $startYearStatType) {
                    ForEach(StatDistributionType.allCases, id: \.self) {
                        Text($0.localizedName)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                let startYearStats = switch startYearStatType {
                case .titles:
                    viewModel.startYearStatsCount
                case .time:
                    viewModel.startYearStatsTime
                case .score:
                    viewModel.startYearStatsScore
                }
                VerticalBarsStatsView(stats: startYearStats)
            }
        }
        .task {
            if mediaType == .anime && viewModel.animeStats == nil {
                await viewModel.getAnimeOverview(userId: userId)
            } else if mediaType == .manga && viewModel.mangaStats == nil {
                await viewModel.getMangaOverview(userId: userId)
            }
        }
    }

    private var mainAnimeStats: some View {
        HStack {
            MediaStatView(name: "Total Anime", value: String(viewModel.animeStats!.count))
            MediaStatView(name: "Episodes Watched", value: String(viewModel.animeStats!.episodesWatched))
            MediaStatView(
                name: "Days Watched",
                value: String(format: "%.2f", viewModel.animeStats!.minutesWatched.minutesToDays())
            )
            MediaStatView(
                name: "Mean Score",
                value: String(format: "%.2f", viewModel.animeStats!.meanScore),
                showDivider: false
            )
        }
    }

    private var mainMangaStats: some View {
        HStack {
            MediaStatView(name: "Total Manga", value: String(viewModel.mangaStats!.count))
            MediaStatView(name: "Chapters Read", value: String(viewModel.mangaStats!.chaptersRead))
            MediaStatView(name: "Volumes Read", value: String(viewModel.mangaStats!.volumesRead))
            MediaStatView(
                name: "Mean Score",
                value: String(format: "%.2f", viewModel.mangaStats!.meanScore),
                showDivider: false
            )
        }
    }
}

#Preview {
    OverviewStatsView(userId: 208863, mediaType: .anime)
}
