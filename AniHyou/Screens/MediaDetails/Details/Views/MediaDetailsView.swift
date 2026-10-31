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
    @State private var viewModel = MediaDetailsViewModel()
    @State private var infoType: MediaInfoType = .general
    @State private var attributedSynopsis = NSAttributedString(string: "Loading")

    @Environment(\.dismiss) private var dismiss
    @AppStorage(LOGGED_IN_KEY) private var isLoggedIn: Bool = false
    @AppStorage(HIDE_SCORES) private var hideScores = false
    @State private var hiddenScores: Bool = true
    @State private var hasScrolled = false
    @State private var showingEditSheet = false
    @State private var showingNotLoggedAlert = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if viewModel.mediaDetails != nil {
                detailsView
                
                statusFab
                    .padding()
            } else {
                ProgressView()
                    .task {
                        await viewModel.getMediaDetails(mediaId: mediaId)
                    }
            }
        }
        .navigationBarTitleDisplayMode(.inline) // fixes banner shuttering
        .navigationBarBackButtonHidden(!isiOS26)
        .toolbar { toolbarContent }
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
                    
                    genresRow
                    
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
                .padding(.bottom, 70)
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
                        name: "Weighted Score",
                        value: "\(viewModel.mediaDetails?.weightedScore ?? 0)%"
                    )
                    .redacted(isEnabled: hideScores && hiddenScores)
                    .onTapGesture {
                        hiddenScores.toggle()
                    }
                    
                    MediaStatView(
                        name: "Mean Score",
                        value: "\(viewModel.mediaDetails?.meanScore ?? 0)%"
                    )
                    .redacted(isEnabled: hideScores && hiddenScores)
                    .onTapGesture {
                        hiddenScores.toggle()
                    }
                    
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
        .padding(.top, 4)
    }//:mainStats
    
    @ViewBuilder
    var genresRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(viewModel.genresFormatted ?? [], id: \.self) { genre in
                    Text(LocalizedStringKey(stringLiteral: genre))
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .tint(.primary)
                        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            }
            .padding(.horizontal)
            .padding(.top, 4)
        }
    }
    
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
    
    @ViewBuilder
    var statusFab: some View {
        Button {
            if isLoggedIn {
                showingEditSheet = true
            } else {
                showingNotLoggedAlert = true
            }
        } label: {
            if let status = viewModel.listEntry?.status?.value {
                Label(status.localizedName, systemImage: status.systemImage)
            } else {
                Label("Add to List", systemImage: "plus")
            }
        }
        .controlSize(.large)
        .font(.system(size: 17, weight: .bold))
        .buttonStyleGlassProminentCompat()
        .alert("Please login to use this feature", isPresented: $showingNotLoggedAlert) {
            Button("OK", role: .cancel) { }
        }
        .sheet(isPresented: $showingEditSheet) {
            MediaListEditView(
                mediaDetails: viewModel.mediaDetails!.fragments.basicMediaDetails,
                mediaList: viewModel.listEntry,
                onSave: { updatedEntry in
                    await viewModel.onEntryUpdated(updatedEntry: updatedEntry)
                },
                onDelete: {
                    await viewModel.onEntryDeleted()
                }
            )
        }
    }
    
    @ToolbarContentBuilder
    var toolbarContent: some ToolbarContent {
        if #unavailable(iOS 26) {
            ToolbarItem(placement: .topBarLeading) {
                ToolbarBackButton(scrolled: hasScrolled) {
                    dismiss()
                }
            }
        }
        ToolbarItem(placement: .topBarTrailing) {
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
        ToolbarItem(placement: .topBarTrailing) {
            if #available(iOS 26, *) {
                ShareLink(item: viewModel.mediaShareLink ?? "") {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                .tint(nil)
            } else {
                ShareLink(item: viewModel.mediaShareLink ?? "") {
                    Image(systemName: "square.and.arrow.up.circle.fill")
                }
                .symbolRenderingMode(.palette)
                .toolbarIconButtonForegroundStyle(scrolled: hasScrolled)
                .environment(\.colorScheme, .dark)
                .font(.system(size: 24))
            }
        }
    }
}

#Preview {
    NavigationStack {
        MediaDetailsView(mediaId: 140960)
    }
}
