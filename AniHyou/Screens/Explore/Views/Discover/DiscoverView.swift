//
//  DiscoverView.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/10/2023.
//

import SwiftUI
import AniListAPI

struct DiscoverView: View {

    @State private var animeViewModel = DiscoverAnimeViewModel()
    @State private var mangaViewModel = DiscoverMangaViewModel()
    @State private var recommendationsViewModel = RecommendationsViewModel()
    @AppStorage(DISCOVER_TAB) private var discoverTab = DiscoverTab.anime
    @AppStorage(LOGGED_IN_KEY) private var isLoggedIn = false
    @State private var hasScrolled = false
    
    var stackAlignment: HorizontalAlignment {
        if discoverTab == .recommendations { .center } else { .leading }
    }

    var body: some View {
        ScrollViewWithOffset(
            showsIndicators: false,
            onScroll: { hasScrolled = $0.y < 0 }
        ) {
            LazyVStack(alignment: stackAlignment, pinnedViews: [.sectionHeaders]) {
                Section {
                    switch discoverTab {
                    case .anime:
                        DiscoverAnimeView(viewModel: animeViewModel)
                    case .manga:
                        DiscoverMangaView(viewModel: mangaViewModel)
                    case .recommendations:
                        RecommendationsView(viewModel: recommendationsViewModel)
                    }
                } header: {
                    VStack(spacing: 0) {
                        Picker("", selection: $discoverTab) {
                            ForEach(DiscoverTab.allCases, id: \.self) { tab in
                                Label(tab.localizedName, systemImage: tab.systemImage).tag(tab)
                            }
                        }
                        .labelStyle(.iconOnly)
                        .pickerStyle(.segmented)
                        .padding(3)
                        .pinnedViewBackground(hasScrolled: hasScrolled)
                        if #unavailable(iOS 26), hasScrolled {
                            Divider()
                        }
                    }
                }
            }
            .padding(.top)
        }
        .navigationTitle(discoverTab.localizedName)
        .refreshable {
            switch discoverTab {
            case .anime:
                await animeViewModel.onRefresh()
            case .manga:
                await mangaViewModel.onRefresh()
            case .recommendations:
                await recommendationsViewModel.onRefresh()
            }
        }
        .toolbar {
            if discoverTab == .recommendations {
                ToolbarItemGroup {
                    recommendationsToolbarContent
                }
            }
        }
        .onAppear {
            if isLoggedIn { recommendationsViewModel.onList = true }
        }
    }
    
    @ViewBuilder
    private var recommendationsToolbarContent: some View {
        Menu {
            Picker("Sort", selection: $recommendationsViewModel.sort) {
                ForEach(RecommendationsViewModel.sortOptions, id: \.self) { sort in
                    Text(sort.lozalizedName)
                }
            }
            .onChange(of: recommendationsViewModel.sort) {
                Task { await recommendationsViewModel.onRefresh() }
            }
        } label: {
            Label("Sort", systemImage: "line.3.horizontal.decrease")
        }
        .tint(nil)
        
        Menu {
            Button {
                recommendationsViewModel.toggleOnList()
            } label: {
                if recommendationsViewModel.onList == true {
                    Label("On my list", systemImage: "checkmark")
                } else {
                    Text("On my list")
                }
            }
            .onChange(of: recommendationsViewModel.onList) {
                Task { await recommendationsViewModel.onRefresh() }
            }
        } label: {
            Label("Filter", systemImage: "ellipsis")
        }
        .tint(nil)
    }
}

@MainActor
@ViewBuilder
func mediaContent(
    title: LocalizedStringKey,
    mediaType: MediaType,
    media: [MediaSortedQuery.Data.Page.Medium],
    blurAdultMedia: Bool,
    headerDestination: @escaping () -> some View
) -> some View {
    ListHeader(key: title, destination: headerDestination)
    
    ZStack {
        if media.count == 0 {
            ProgressView()
        }
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top) {
                ForEach(media, id: \.id) { item in
                    NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                        VListItemView(
                            title: item.title?.userPreferred ?? "",
                            imageUrl: item.coverImage?.large,
                            meanScore: item.meanScore,
                            status: item.mediaListEntry?.status?.value,
                            blurCover: blurAdultMedia && item.isAdult == true
                        )
                        .padding(.trailing, 4)
                        .mediaContextMenu(
                            mediaId: item.id,
                            mediaType: mediaType,
                            mediaListStatus: item.mediaListEntry?.status?.value
                        )
                    }
                    .buttonStyle(.plain)
                }
            }//:HStack
            .padding(.leading, 18)
        }//:HScrollView
        .frame(minHeight: 180)
    }//:ZStack
    .padding(.bottom)
}

#Preview {
    NavigationStack {
        DiscoverView()
    }
}
