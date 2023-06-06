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
    @State private var infoType: ProfileInfoType = .activity
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
                    profileHeader
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    
                    if viewModel.userAbout != nil || viewModel.userInfo != nil {
                        ScrollView(.vertical) {
                            VStack {
                                if isMyProfile {
                                    ProfileBioView(viewModel.userInfo?.about!, isHtml: true)
                                } else {
                                    ProfileBioView(viewModel.userAbout!, isHtml: true)
                                }
                            }
                        }
                        .padding(16)
                    } else {
                        VStack {
                            Spacer()
                            Text("Unable to load user bio")
                            Spacer()
                        }
                        .padding(16)
                    }
                    
                    if viewModel.userInfo != nil {
                        Section {
                            switch infoType {
//                            case .about:
//                                UserAboutView(userId: viewModel.userInfo!.id)
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
                    viewModel.getUserAbout(userId: userId!)
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
