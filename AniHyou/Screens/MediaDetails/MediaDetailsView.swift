//
//  MediaDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import Kingfisher

struct MediaDetailsView: View {
    
    var mediaId: Int
    @StateObject private var viewModel = MediaDetailsViewModel()
    @State private var showingMediaListSheet = false
    private let coverWidth: CGFloat = 100
    private let coverHeight: CGFloat = 153
    private let bannerHeight: CGFloat = 200
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading) {
                // MARK: Header
                TopBannerView(imageUrl: viewModel.mediaDetails?.bannerImage, placeholderHexColor: viewModel.mediaDetails?.coverImage?.color, height: bannerHeight)
                
                // MARK: Main info
                HStack(alignment: .top) {
                    
                    MediaCoverView(imageUrl: viewModel.mediaDetails?.coverImage?.large, width: coverWidth, height: coverHeight)
                    
                    VStack(alignment: .leading) {
                        
                        Text(viewModel.mediaDetails?.title?.romaji ?? "")
                            .font(.title3)
                            .bold()
                            .lineLimit(3)
                            .padding(.bottom, 1)
                        
                        Text(viewModel.mediaDetails?.format?.formatted ?? "Unknown")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        Button(action: {
                            if viewModel.mediaDetails?.mediaListEntry?.status == nil {
                                //add to list
                            } else {
                                //open
                                showingMediaListSheet = true
                            }
                        }) {
                            Text(viewModel.mediaDetails?.mediaListEntry?.status?.localizedName ?? "Add to List")
                                .bold()
                                .textCase(.uppercase)
                        }
                        .buttonStyle(.borderedProminent)
                        .sheet(isPresented: $showingMediaListSheet) {
                            if let mediaList = viewModel.mediaDetails?.mediaListEntry {
                                MediaListEditView(mediaId: mediaId, mediaList: mediaList)
                            }
                        }
                    }//:VStack
                    .padding(.leading, 12)
                    .padding(.trailing, 8)
                    
                    Spacer()
                }//:HStack
                .padding(.top)
                .padding(.leading)
                
                // MARK: Main stats
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack {
                        Divider()
                        HStack {
                            if let schedule = viewModel.mediaDetails?.nextAiringEpisode {
                                MediaStatView(name: "Airing", value: "Ep \(schedule.episode) in \(schedule.timeUntilAiring.timestampToDaysOrHoursOrMinutes())")
                            }
                            MediaStatView(name: "Average Score", value: "\(viewModel.mediaDetails?.averageScore ?? 0)%")
                            MediaStatView(name: "Mean Score", value: "\(viewModel.mediaDetails?.meanScore ?? 0)%")
                            MediaStatView(name: "Status", value: viewModel.mediaDetails?.status?.formatted ?? "Unknown")
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
                
                Divider()
                    .padding()
                // MARK: Other info
                Group {
                    Text("Information")
                        .font(.title3)
                        .bold()
                        .padding(.leading)
                    MediaInfoView(name: "Genres", value: viewModel.genresFormatted, isExpandable: true)
                    if isAnime {
                        MediaInfoView(name: "Episodes", value: viewModel.mediaDetails?.episodes?.formatted())
                    } else {
                        MediaInfoView(name: "Chapters", value: viewModel.mediaDetails?.chapters?.formatted())
                        MediaInfoView(name: "Volumes", value: viewModel.mediaDetails?.volumes?.formatted())
                    }
                    MediaInfoView(name: "Start date", value: viewModel.mediaDetails?.startDate?.fragments.fuzzyDate.formatted())
                    MediaInfoView(name: "End date", value: viewModel.mediaDetails?.endDate?.fragments.fuzzyDate.formatted())
                    
                    if isAnime {
                        MediaInfoView(name: "Season", value: viewModel.seasonFormatted)
                        MediaInfoView(name: "Studios", value: viewModel.studiosFormatted, isExpandable: true)
                        MediaInfoView(name: "Producers", value: viewModel.producersFormatted, isExpandable: true)
                    }
                    MediaInfoView(name: "Source", value: viewModel.mediaDetails?.source?.formatted)
                    MediaInfoView(name: "Romaji", value: viewModel.mediaDetails?.title?.romaji)
                    MediaInfoView(name: "English", value: viewModel.mediaDetails?.title?.english)
                    MediaInfoView(name: "Native", value: viewModel.mediaDetails?.title?.native)
                }
                
                //Spacer()
            }//:VStack
            .padding(.bottom)
        }//:VScrollView
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            viewModel.getMediaDetails(id: mediaId)
        }
    }
    
    var isAnime: Bool {
        return viewModel.mediaDetails?.type == .anime
    }
}

struct MediaDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailsView(mediaId: 140960)
    }
}
