//
//  ProfileView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import SwiftUI
import AniListAPI
import RichText

private let avatarSize: CGFloat = 110
private let bannerHeight: CGFloat = 110

fileprivate extension View {
    @ViewBuilder
    func pinnedViewBackground(hasScrolled: Bool) -> some View {
        if #available(iOS 26, *) {
            self
                .glassEffect(isEnabled: hasScrolled)
        } else {
            self
                .background(hasScrolled ? Material.bar.opacity(1.0) : Material.ultraThin.opacity(0.0))
        }
    }
}

struct ProfileView: View {

    var userId: Int?
    var isMyProfile: Bool {
        userId == nil
    }
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showLogOutDialog = false
    @State private var infoType: ProfileInfoType = .activity
    @State private var hasScrolled = false
    @State private var showingMediaDetails = false
    @State private var mediaId = 0
    @State private var showingImageSheet = false
    @State private var refreshId = UUID()

    var body: some View {
        if isMyProfile {
            NavigationStack {
                content
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        toolbarContent
                    }
                    .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
                    .task {
                        await viewModel.getMyUserInfo()
                    }
            }//:NavigationStack
        } else {
            content
                .toolbar {
                    toolbarContent
                }
                .task {
                    await viewModel.getUserInfo(userId: userId!)
                }
                .tint(Color(hex: viewModel.userInfo?.options?.profileColor?.profileHexColor) ?? .accentColor)
                .environment(
                    \.scoreFormat,
                     viewModel.userInfo?.mediaListOptions?.scoreFormat?.value ?? .point100
                )
        }
    }//:body
    
    @ToolbarContentBuilder
    var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            let username = viewModel.userInfo?.name ?? "Profile"
            if #available(iOS 26, *) {
                Text(username)
                    .bold()
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .glassEffect()
                    .opacity(hasScrolled ? 1 : 0)
            } else {
                Text(username)
                    .bold()
                    .opacity(hasScrolled ? 1 : 0)
            }
        }
    }

    var content: some View {
        ScrollViewWithOffset(onScroll: { hasScrolled = $0.y < 0 }) {
            TopBannerView(
                imageUrl: viewModel.userInfo?.bannerImage,
                placeholderHexColor: viewModel.userInfo?.options?.profileColor?.profileHexColor,
                height: bannerHeight
            )
            .ignoresSafeArea(edges: .top)
            
            mainProfileInfo
                .padding(.top, -50)
            
            profileBio
            
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                    
                otherProfileInfo
            }//:LazyVStack
        }//:VScrollView
        .id(refreshId)
        .refreshable {
            refreshId = UUID()
        }
    }

    @ViewBuilder
    var mainProfileInfo: some View {
        HStack {
            VStack {
                Button(action: { showingImageSheet.toggle() }) {
                    CircleImageView(imageUrl: viewModel.userInfo?.avatar?.large, size: avatarSize)
                        .overlay {
                            Circle()
                                .stroke(.background, lineWidth: 3.5)
                        }
                }
                
                Group {
                    if let username = viewModel.userInfo?.name {
                        Text(username)
                    } else {
                        Text("Loading")
                            .redacted(reason: .placeholder)
                    }
                }
                .font(.title2.weight(.bold))
                .transition(.move(edge: .top))
                
                if
                    let donatorTier = viewModel.userInfo?.donatorTier,
                    donatorTier > 1
                {
                    Group {
                        if let donatorText = viewModel.userInfo?.donatorBadge {
                            Text(donatorText)
                        } else {
                            Text("Donator")
                        }
                    }
                    .foregroundStyle(.tint)
                }
            }//:VStack
            .padding(.leading, 16)
            Spacer()
            
            if isMyProfile {
                NavigationLink(destination: SettingsView()) {
                    Label("Settings", systemImage: "gearshape")
                }
                .padding()
                .buttonStyleGlassProminentCompat()
            } else {
                VStack(alignment: .center) {
                    if viewModel.userInfo?.isFollowing == true {
                        Button("Unfollow", action: {
                            Task {
                                await viewModel.toggleFollow(userId: userId!)
                            }
                        })
                        .buttonStyle(.bordered)
                    } else if viewModel.userInfo?.isFollowing == false {
                        Button("Follow", action: {
                            Task {
                                await viewModel.toggleFollow(userId: userId!)
                            }
                        })
                        .buttonStyleGlassProminentCompat()
                    }
                    if viewModel.userInfo?.isFollower == true {
                        Text("Follows you")
                            .font(.footnote)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 24)
            }
        }//:HStack
        .sheet(isPresented: $showingImageSheet) {
            FullCoverView(imageUrl: viewModel.userInfo?.avatar?.large)
        }
    }
    
    @ViewBuilder
    var profileBio: some View {
        ScrollView(.vertical) {
            VStack {
                if let about = viewModel.userInfo?.about {
                    ExpandableRichText(about)
                } else if viewModel.isLoading {
                    HorizontalProgressView()
                }
            }
        }
        .padding(16)
    }
    
    @ViewBuilder
    var otherProfileInfo: some View {
        if let userInfo = viewModel.userInfo {
            Section {
                VStack(alignment: .leading) {
                    switch infoType {
                    case .activity:
                        UserActivityView(userId: userInfo.id, isMyProfile: isMyProfile)
                    case .stats:
                        UserStatsHostView(userId: userInfo.id)
                    case .favorites:
                        UserFavoritesView(userId: userInfo.id)
                    case .social:
                        UserSocialView(userId: userInfo.id)
                    }
                }
            } header: {
                VStack(spacing: 0) {
                    Picker("Info type", selection: $infoType) {
                        ForEach(ProfileInfoType.allCases, id: \.self) { type in
                            Label(type.localizedName, systemImage: type.systemImage)
                        }
                    }
                    .pickerStyle(.segmented)
                    .labelStyle(.iconOnly)
                    .padding()
                    .pinnedViewBackground(hasScrolled: hasScrolled)
                    if #unavailable(iOS 26) {
                        Divider()
                    }
                }
            }//:Section
        }
    }
}

#Preview {
    ProfileView(userId: 208863)
}
