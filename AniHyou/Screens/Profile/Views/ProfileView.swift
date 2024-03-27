//
//  ProfileView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import SwiftUI
import Kingfisher
import AniListAPI
import RichText

private let avatarSize: CGFloat = 110
private let bannerHeight: CGFloat = 110

struct ProfileView: View {

    var userId: Int?
    var isMyProfile: Bool {
        return userId == nil
    }
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showLogOutDialog = false
    @State private var infoType: ProfileInfoType = .activity
    @State private var hasScrolled = false
    @State private var showingMediaDetails = false
    @State private var mediaId = 0
    @State private var showingImageSheet = false

    var body: some View {
        if isMyProfile {
            NavigationStack {
                content
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text(viewModel.userInfo?.name ?? "Profile")
                                .bold()
                                .opacity(hasScrolled ? 1 : 0)
                        }
                    }
                    .addOnOpenMediaUrl($showingMediaDetails, $mediaId)
            }//:NavigationStack
        } else {
            content
                .tint(Color(hex: viewModel.userInfo?.options?.profileColor?.profileHexColor) ?? .accentColor)
        }
    }//:body

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
            
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                    
                profileBio
                    
                otherProfileInfo
            }//:LazyVStack
        }//:VScrollView
        .onAppear {
            if isMyProfile {
                viewModel.getMyUserInfo()
            } else {
                viewModel.getUserInfo(userId: userId!)
            }
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
            } else {
                VStack(alignment: .center) {
                    if viewModel.userInfo?.isFollowing == true {
                        Button("Unfollow", action: { viewModel.toggleFollow(userId: userId!) })
                            .buttonStyle(.bordered)
                    } else if viewModel.userInfo?.isFollowing == false {
                        Button("Follow", action: { viewModel.toggleFollow(userId: userId!) })
                            .buttonStyle(.borderedProminent)
                    }
                    if viewModel.userInfo?.isFollower == true {
                        Text("Follows you")
                            .font(.footnote)
                    }
                }
                .padding(.horizontal)
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
                } else {
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
                    .background(hasScrolled ? Material.bar.opacity(1.0) : Material.ultraThin.opacity(0.0))
                    Divider()
                }
            }//:Section
        }
    }
}

#Preview {
    ProfileView(userId: 208863)
}
