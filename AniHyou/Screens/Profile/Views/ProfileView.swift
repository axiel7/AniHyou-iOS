//
//  ProfileView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import SwiftUI
import Kingfisher
import API

private let avatarSize: CGFloat = 110
private let bannerHeight: CGFloat = 30

extension Label {
    func labelButtonIcon() -> some View {
        self
            .labelStyle(.iconOnly)
            .font(.system(size: 22))
    }
    
    func toolbarMaterialLabel() -> some View {
        self
            .frame(width: 32, height: 32)
            .background(.ultraThinMaterial)
            .clipShape(Circle())
    }
}

struct ProfileView: View {
    
    var userId: Int? = nil
    var isMyProfile: Bool {
        return userId == nil
    }
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showLogOutDialog = false
    @State private var infoType: ProfileInfoType = .about
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                    profileHeader
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    
                    if viewModel.userInfo != nil {
                        Section {
                            switch infoType {
                            case .about:
                                UserAboutView(userId: viewModel.userInfo!.id)
                            case .activity:
                                UserActivityView(userId: viewModel.userInfo!.id)
                            case .stats:
                                UserStatsHostView(userId: viewModel.userInfo!.id)
                            case .favorites:
                                UserFavoritesView(userId: viewModel.userInfo!.id)
                            case .social:
                                UserSocialView(userId: viewModel.userInfo!.id)
                            }
                        } header: {
                            Picker("Info type", selection: $infoType) {
                                ForEach(ProfileInfoType.allCases, id: \.self) { type in
                                    Label(type.localizedName, systemImage: type.systemImage)
                                }
                            }
                            .pickerStyle(.segmented)
                            .labelStyle(.iconOnly)
                            .padding()
                        }//:Section
                    }
                }
                //:LazyVStack
            }//:VScrollView
            .ignoresSafeArea(edges: .top)
            .onAppear {
                if isMyProfile {
                    viewModel.getMyUserInfo()
                } else {
                    viewModel.getUserInfo(userId: userId!)
                }
            }
        }//:NavigationView
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
    }//:body
    
    var profileHeader: some View {
        ZStack {
            TopBannerView(imageUrl: viewModel.userInfo?.bannerImage, placeholderHexColor: viewModel.userInfo?.hexColor, height: bannerHeight)
                .frame(height: bannerHeight)
            
            HStack {
                if isMyProfile {
                    Label(String(viewModel.userInfo?.unreadNotificationCount ?? 0), systemImage: "bell")
                        .font(.title2)
                        .foregroundColor(.clear)
                        .padding(.horizontal, 16)
                }
                Spacer()
                VStack {
                    CircleImageView(imageUrl: viewModel.userInfo?.avatar?.large, size: avatarSize)
                        .shadow(radius: 7)
                    
                    Text(viewModel.userInfo?.name ?? "")
                        .font(.title2)
                        .bold()
                        .frame(alignment: .center)
                        .transition(.move(edge: .top))
                }
                Spacer()
                
                if isMyProfile {
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gearshape")
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
