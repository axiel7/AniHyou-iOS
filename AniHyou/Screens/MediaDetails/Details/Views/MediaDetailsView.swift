//
//  MediaDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI

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
                        ScrollView(.horizontal, showsIndicators: false) {
                            VStack {
                                Divider()
                                HStack {
                                    if let schedule = details.nextAiringEpisode {
                                        MediaStatView(
                                            name: "Airing",
                                            value: String(swiftLintMultiline:
                                                "Ep ",
                                                String(schedule.episode),
                                                " in ",
                                                schedule.timeUntilAiring.secondsToLegibleText()
                                            )
                                        )
                                    }
                                    MediaStatView(
                                        name: "Average Score",
                                        value: "\(details.averageScore ?? 0)%"
                                    )
                                    MediaStatView(
                                        name: "Mean Score",
                                        value: "\(details.meanScore ?? 0)%"
                                    )
                                    MediaStatView(
                                        name: "Status",
                                        value: details.status?.value?.localizedName ?? "Unknown"
                                    )
                                    MediaStatView(
                                        name: "Popularity",
                                        value: (details.popularity ?? 0).formatted()
                                    )
                                    MediaStatView(
                                        name: "Favorites",
                                        value: (details.favourites ?? 0).formatted(),
                                        showDivider: false
                                    )
                                }
                                .padding(.vertical, 4)
                                Divider()
                            }//:VStack
                            .padding(.leading)
                        }//:HScrollView
                        .padding(.top)

                        // MARK: - Synopsis
                        ExpandableTextView(text: $attributedSynopsis)
                            .padding(.top)
                            .padding(.leading)
                            .padding(.trailing)

                        // MARK: - More info
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
                    }//:VStack
                    .padding(.bottom)
                }//:VScrollView
                .edgesIgnoringSafeArea(.top)
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.getMediaDetails(mediaId: mediaId)
                    }
            }
        }//:Group
        .navigationBarBackButtonHidden(!hasScrolled)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if !hasScrolled {
                    ToolbarIconButton(symbolSystemName: "chevron.left") {
                        dismiss()
                    }
                    .transition(.slide)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                if let details = viewModel.mediaDetails {
                    if !hasScrolled {
                        ToolbarIconButton(
                            symbolSystemName: details.isFavourite ? "heart.fill" : "heart"
                        ) {
                            viewModel.toggleFavorite()
                        }
                    } else {
                        Button(action: { viewModel.toggleFavorite() }, label: {
                            Image(systemName: details.isFavourite ? "heart.fill" : "heart")
                        })
                    }
                }
            }
        }
        .onChange(of: viewModel.mediaDetails) { details in
            DispatchQueue.main.async {
                attributedSynopsis = details?.description?.htmlToAttributedString()
                    ?? NSAttributedString(string: "No description")
            }
        }
    }
}

#Preview {
    MediaDetailsView(mediaId: 140960)
}
