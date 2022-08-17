//
//  MediaDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI

private let bannerHeight: CGFloat = 180

struct MediaDetailsView: View {
    
    var mediaId: Int
    @StateObject private var viewModel = MediaDetailsViewModel()
    @State private var infoType: MediaInfoType = .general
    
    var body: some View {
        if viewModel.mediaDetails != nil {
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    // MARK: Header
                    TopBannerView(imageUrl: viewModel.mediaDetails!.bannerImage, placeholderHexColor: viewModel.mediaDetails!.coverImage?.color, height: bannerHeight)
                    
                    // MARK: Main info
                    MediaDetailsMainInfo(viewModel: viewModel)
                    
                    // MARK: Main stats
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack {
                            Divider()
                            HStack {
                                if let schedule = viewModel.mediaDetails?.nextAiringEpisode {
                                    MediaStatView(name: "Airing", value: "Ep \(schedule.episode) in \(schedule.timeUntilAiring.timestampToLegibleText())")
                                }
                                MediaStatView(name: "Average Score", value: "\(viewModel.mediaDetails?.averageScore ?? 0)%")
                                MediaStatView(name: "Mean Score", value: "\(viewModel.mediaDetails?.meanScore ?? 0)%")
                                MediaStatView(name: "Status", value: viewModel.mediaDetails?.status?.localizedName ?? "Unknown")
                                MediaStatView(name: "Popularity", value: (viewModel.mediaDetails?.popularity ?? 0).formatted())
                                MediaStatView(name: "Favorites", value: (viewModel.mediaDetails?.favourites ?? 0).formatted(), showDivider: false)
                            }
                            .padding(.top, 4)
                            .padding(.bottom, 4)
                            Divider()
                        }//:VStack
                        .padding(.leading)
                    }//:HScrollView
                    .padding(.top)
                    
                    // MARK: synopsis
                    ExpandableTextView(viewModel.mediaDetails?.description?.htmlStripped)
                        .padding(.top)
                        .padding(.leading)
                        .padding(.trailing)
                    
                    // MARK: More info
                    Picker("Info type", selection: $infoType) {
                        ForEach(MediaInfoType.allCases, id: \.self) { type in
                            Label(type.formatted, systemImage: type.systemImage)
                        }
                    }
                    .pickerStyle(.segmented)
                    .labelStyle(.iconOnly)
                    .padding()
                    
                    Group {
                        switch infoType {
                        case .general:
                            MediaGeneralInfoView(viewModel: viewModel)
                        case .charactersAndStaff:
                            MediaCharactersAndStaffView(viewModel: viewModel)
                                .onAppear {
                                    viewModel.getMediaCharactersAndStaff(mediaId: mediaId)
                                }
                        case .relationsAndRecommendations:
                            MediaRelationsAndRecommendationsView(viewModel: viewModel)
                                .onAppear {
                                    viewModel.getMediaRelationsAndRecommendations(mediaId: mediaId)
                                }
                        case .stats:
                            Text("stats")
                        case .reviewsAndThreads:
                            MediaReviewsAndThreadsView(viewModel: viewModel)
                                .onAppear {
                                    viewModel.getMediaReviews(mediaId: mediaId)
                                    viewModel.getMediaThreads(mediaId: mediaId)
                                }
                        }
                    }//:Group
                    .frame(minWidth: 120)
                }//:VStack
                .padding(.bottom)
            }//:VScrollView
            .edgesIgnoringSafeArea(.top)
            .toolbar {
                ToolbarItem {
                    Button {
                        switch viewModel.mediaDetails!.type {
                        case .anime:
                            shareSheet(url: "\(ANILIST_ANIME_URL)\(mediaId)")
                        case .manga:
                            shareSheet(url: "\(ANILIST_MANGA_URL)\(mediaId)")
                        default:
                            break
                        }
                    } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    .padding(.trailing)
                }
            }
        } else {
            ProgressView()
                .onAppear {
                    viewModel.getMediaDetails(id: mediaId)
                }
        }
    }
}

struct MediaDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailsView(mediaId: 140960)
    }
}
