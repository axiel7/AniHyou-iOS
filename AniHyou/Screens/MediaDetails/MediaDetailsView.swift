//
//  MediaDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import Kingfisher

private let coverWidth: CGFloat = 100
private let coverHeight: CGFloat = 153
private let bannerHeight: CGFloat = 180

struct MediaDetailsView: View {
    
    var mediaId: Int
    @StateObject private var viewModel = MediaDetailsViewModel()
    @State private var showingEditSheet = false
    @State private var showingCoverSheet = false
    @State private var showingNotLoggedAlert = false
    @State private var infoType: MediaInfoType = .general
    
    var body: some View {
        if viewModel.mediaDetails != nil {
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    // MARK: Header
                    TopBannerView(imageUrl: viewModel.mediaDetails!.bannerImage, placeholderHexColor: viewModel.mediaDetails!.coverImage?.color, height: bannerHeight)
                    
                    // MARK: Main info
                    HStack(alignment: .top) {
                        
                        MediaCoverView(imageUrl: viewModel.mediaDetails!.coverImage?.large, width: coverWidth, height: coverHeight)
                            .sheet(isPresented: $showingCoverSheet) {
                                FullCoverView(imageUrl: viewModel.mediaDetails!.coverImage?.extraLarge)
                            }
                            .onTapGesture {
                                showingCoverSheet = true
                            }
                        
                        VStack(alignment: .leading) {
                            
                            Text(viewModel.mediaDetails!.title?.romaji ?? "")
                                .font(.title3)
                                .bold()
                                .lineLimit(3)
                                .padding(.bottom, 1)
                            
                            Text(viewModel.mediaDetails!.format?.formatted ?? "Unknown")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            HStack {
                                Button {
                                    if isLoggedIn() {
                                        showingEditSheet = true
                                    } else {
                                        showingNotLoggedAlert = true
                                    }
                                } label: {
                                    Text(viewModel.mediaDetails!.mediaListEntry?.status?.localizedName ?? "Add to List")
                                        .bold()
                                        .textCase(.uppercase)
                                }//:Button
                                .buttonStyle(.borderedProminent)
                                .sheet(isPresented: $showingEditSheet) {
                                    MediaListEditView(mediaId: mediaId, mediaType: viewModel.mediaDetails!.type!, mediaList: viewModel.mediaDetails!.mediaListEntry)
                                }
                                .alert("Please login to use this feature", isPresented: $showingNotLoggedAlert) {
                                    Button("OK", role: .cancel) { }
                                }
                                Spacer()
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
                                        .labelButtonIcon()
                                }
                                .padding(.trailing)
                                
                            }
                        }//:VStack
                        .padding(.leading, 12)
                        .padding(.trailing, 8)
                        
                        //Spacer()
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
                    
                    // MARK: More info
                    Picker("Info type", selection: $infoType) {
                        ForEach(MediaInfoType.allCases, id: \.self) { type in
                            Label(type.formatted, systemImage: type.systemImage)
                        }
                    }
                    .pickerStyle(.segmented)
                    .labelStyle(.iconOnly)
                    .padding(8)
                    
                    //Divider().padding()
                    
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
                                }
                        }
                    }//:Group
                    .frame(minWidth: 120)
                }//:VStack
                .padding(.bottom)
            }//:VScrollView
            .edgesIgnoringSafeArea(.top)
        } else {
            ProgressView()
                .onAppear {
                    viewModel.getMediaDetails(id: mediaId)
                }
        }
    }
    
    func shareSheet(url: String?) {
        guard let url = url else { return }
        guard let urlShare = URL(string: url) else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct MediaDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailsView(mediaId: 140960)
    }
}
