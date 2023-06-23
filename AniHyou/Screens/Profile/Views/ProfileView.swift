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
private let bannerHeight: CGFloat = 10

struct ProfileView: View {
    
    var userId: Int? = nil
    var isMyProfile: Bool {
        return userId == nil
    }
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showLogOutDialog = false
    @State private var infoType: ProfileInfoType = .activity
    @State private var scrollOffset = CGFloat.zero
    private var hasScrolled: Bool {
        withAnimation {
            scrollOffset > 0
        }
    }
    
    var body: some View {
        if isMyProfile {
            NavigationView {
                content
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text(viewModel.userInfo?.name ?? "Profile")
                                .bold()
                                .opacity(hasScrolled ? 1 : 0)
                        }
                    }
            }//:NavigationView
            .navigationViewStyle(.stack)
        } else {
            content
        }
    }//:body
    
    var content: some View {
        ObservableVScrollView(scrollOffset: $scrollOffset) { _ in
            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                profileHeader
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .ignoresSafeArea(edges: .top)
                
                ScrollView(.vertical) {
                    VStack {
                        if viewModel.userInfo != nil {
                            ExpandableRichText(viewModel.userInfo?.about)
                        } else {
                            ProgressView()
                        }
                    }
                }
                .padding(16)
                
                if viewModel.userInfo != nil {
                    Section {
                        switch infoType {
                        case .activity:
                            UserActivityView(userId: viewModel.userInfo!.id, isMyProfile: isMyProfile)
                        case .stats:
                            UserStatsHostView(userId: viewModel.userInfo!.id)
                        case .favorites:
                            UserFavoritesView(userId: viewModel.userInfo!.id)
                        case .social:
                            UserSocialView(userId: viewModel.userInfo!.id)
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
            //:LazyVStack
        }//:VScrollView
        .onAppear {
            if isMyProfile {
                viewModel.getMyUserInfo()
            } else {
                viewModel.getUserInfo(userId: userId!)
            }
        }
    }
    
    var profileHeader: some View {
        ZStack {
            TopBannerView(imageUrl: viewModel.userInfo?.bannerImage, placeholderHexColor: viewModel.userInfo?.hexColor, height: bannerHeight)
                .frame(height: bannerHeight)
            
            HStack {
                VStack {
                    CircleImageView(imageUrl: viewModel.userInfo?.avatar?.large, size: avatarSize)
                        .shadow(radius: 7)
                    
                    Text(viewModel.userInfo?.name ?? "Name")
                        .font(.title2)
                        .bold()
                        .transition(.move(edge: .top))
                }
                .padding(.leading, 16)
                Spacer()
                
                if isMyProfile {
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gearshape")
                    }
                    .padding(.horizontal)
                } else {
                    VStack(alignment: .center) {
                        if viewModel.userInfo?.isFollowing == true {
                            Button("Unfollow", action: { viewModel.toggleFollow(userId: userId!) })
                                .buttonStyle(.bordered)
                        }
                        else if viewModel.userInfo?.isFollowing == false {
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
            }
            .padding(.top, 85)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}
