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
                    MediaDetailsMainInfo(mediaId: mediaId, viewModel: viewModel)
                    
                    // MARK: Main stats
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack {
                            Divider()
                            HStack {
                                if let schedule = viewModel.mediaDetails?.nextAiringEpisode {
                                    MediaStatView(name: "Airing", value: "Ep \(schedule.episode) in \(schedule.timeUntilAiring.secondsToLegibleText())")
                                }
                                MediaStatView(name: "Average Score", value: "\(viewModel.mediaDetails?.averageScore ?? 0)%")
                                MediaStatView(name: "Mean Score", value: "\(viewModel.mediaDetails?.meanScore ?? 0)%")
                                MediaStatView(name: "Status", value: viewModel.mediaDetails?.status?.value?.localizedName ?? "Unknown")
                                MediaStatView(name: "Popularity", value: (viewModel.mediaDetails?.popularity ?? 0).formatted())
                                MediaStatView(name: "Favorites", value: (viewModel.mediaDetails?.favourites ?? 0).formatted(), showDivider: false)
                            }
                            .padding(.vertical, 4)
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
                            Label(type.localizedName, systemImage: type.systemImage)
                        }
                    }
                    .pickerStyle(.segmented)
                    .labelStyle(.iconOnly)
                    .padding()
                    
                    ZStack {
                        switch infoType {
                        case .general:
                            MediaGeneralInfoView(viewModel: viewModel)
                        case .charactersAndStaff:
                            MediaCharactersAndStaffView(mediaId: mediaId)
                        case .relationsAndRecommendations:
                            MediaRelationsAndRecommendationsView(mediaId: mediaId)
                        case .stats:
                            VStack(alignment: .center) {
                                Text("Coming soon")
                            }
                            .frame(maxWidth: .infinity)
                        case .reviewsAndThreads:
                            MediaReviewsAndThreadsView(mediaId: mediaId)
                        }
                    }//:ZStack
                    .frame(minHeight: 200)
                }//:VStack
                .padding(.bottom)
            }//:VScrollView
            .edgesIgnoringSafeArea(.top)
            .toolbar {
                ToolbarItem {
                    ShareLink(item: viewModel.mediaShareLink ?? "") {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    .padding(.trailing)
                }
            }
        } else {
            ProgressView()
                .onAppear {
                    viewModel.getMediaDetails(mediaId: mediaId)
                }
        }
    }
}

struct MediaDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailsView(mediaId: 140960)
    }
}
