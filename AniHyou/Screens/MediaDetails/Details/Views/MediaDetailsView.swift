//
//  MediaDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI
import AniListAPI

private let bannerHeight: CGFloat = 180

struct MediaDetailsView: View {

    let mediaId: Int
    @StateObject private var viewModel = MediaDetailsViewModel()
    @State private var infoType: MediaInfoType = .general
    @State private var attributedSynopsis = NSAttributedString(string: "Loading")

    @Environment(\.dismiss) private var dismiss
    @State private var hasScrolled = false

    var body: some View {
        Group {
            if viewModel.mediaDetails != nil {
                detailsView
            } else {
                ProgressView()
                    .task {
                        await viewModel.getMediaDetails(mediaId: mediaId)
                    }
            }
        }//:Group
        .navigationBarTitleDisplayMode(.inline) // fixes banner shuttering
        .navigationBarBackButtonHidden(!isiOS26)
        .toolbar {
            if #unavailable(iOS 26) {
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarBackButton(scrolled: hasScrolled) {
                        dismiss()
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                if let details = viewModel.mediaDetails {
                    if #available(iOS 26, *) {
                        Button(action: {
                            Task {
                                await viewModel.toggleFavorite()
                            }
                        }) {
                            let icon = if details.isFavourite {
                                "heart.fill"
                            } else {
                                "heart"
                            }
                            Image(systemName: icon)
                        }
                        .tint(nil)
                    } else {
                        ToolbarIconButton(
                            systemImage: "heart",
                            inverted: details.isFavourite,
                            scrolled: hasScrolled
                        ) {
                            Task {
                                await viewModel.toggleFavorite()
                            }
                        }
                        .font(.system(size: 24))
                    }
                }
            }
        }
        .onChange(of: viewModel.mediaDetails) {
            DispatchQueue.main.async {
                attributedSynopsis = viewModel.mediaDetails?.description?.htmlToAttributedString()
                    ?? NSAttributedString(string: "No description")
            }
        }
    }
    
    @ViewBuilder
    var detailsView: some View {
        if let details = viewModel.mediaDetails {
            ScrollViewWithOffset(onScroll: { hasScrolled = $0.y < 0 }) {
                LazyVStack(alignment: .leading) {
                    // MARK: - Header
                    TopBannerView(
                        imageUrl: details.bannerImage,
                        placeholderHexColor: details.coverImage?.color,
                        height: bannerHeight
                    )
                    
                    // MARK: - Main info
                    MediaDetailsMainInfo(mediaId: mediaId, viewModel: viewModel)
                    
                    // MARK: - Main stats
                    mainStats
                    
                    // MARK: - Synopsis
                    ExpandableTextView(
                        text: $attributedSynopsis,
                        showTranslate: !isLocaleEnglish
                    )
                    .padding(.top)
                    .padding(.horizontal)
                    
                    // MARK: - More info
                    moreInfo
                }//:VStack
                .padding(.bottom)
            }//:VScrollView
            .ignoresSafeArea(edges: .top)
        }
    }//:detailsView
    
    @ViewBuilder
    var mainStats: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Divider()
                HStack {
                    if let schedule = viewModel.mediaDetails?.nextAiringEpisode {
                        let relativeDate = Date(timeIntervalSince1970: Double(schedule.airingAt))
                        MediaStatView(
                            name: "Airing",
                            value: LocalizedStringKey(
                                "Ep \(schedule.episode) \(relativeDate, format: .relative(presentation: .numeric))"
                            )
                        )
                    }
                    MediaStatView(
                        name: "Mean Score",
                        value: "\(viewModel.mediaDetails?.meanScore ?? 0)%"
                    )
                    MediaStatView(
                        name: "Average Score",
                        value: "\(viewModel.mediaDetails?.averageScore ?? 0)%"
                    )
                    MediaStatView(
                        name: "Status",
                        value: viewModel.mediaDetails?.status?.value?.localizedName
                    )
                    MediaStatView(
                        name: "Popularity",
                        value: (viewModel.mediaDetails?.popularity ?? 0).formatted()
                    )
                    MediaStatView(
                        name: "Favorites",
                        value: (viewModel.mediaDetails?.favourites ?? 0).formatted(),
                        showDivider: false
                    )
                }
                .padding(.vertical, 4)
                Divider()
            }//:VStack
            .padding(.leading)
        }//:HScrollView
        .padding(.top)
    }//:mainStats
    
    @ViewBuilder
    var moreInfo: some View {
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
                MediaStatsView(mediaId: mediaId)
            case .reviewsAndThreads:
                MediaReviewsAndThreadsView(mediaId: mediaId)
            }
        }//:ZStack
        .frame(minHeight: 200)
    }//:moreInfo
}

#Preview {
    NavigationStack {
        MediaDetailsView(mediaId: 140960)
    }
}
