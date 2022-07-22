//
//  ProfileView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import SwiftUI
import Kingfisher

private let avatarSize: CGFloat = 110
private let bannerHeight: CGFloat = 150

extension Label {
    func labelButtonIcon() -> some View {
        self
            .labelStyle(.iconOnly)
            .font(.system(size: 22))
    }
}

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showLogOutDialog = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    TopBannerView(imageUrl: viewModel.myUserInfo?.bannerImage, placeholderHexColor: viewModel.myUserInfo?.hexColor, height: bannerHeight)
                    
                    HStack {
                        NavigationLink(destination: UserAboutView(userId: viewModel.myUserInfo?.id ?? 0)) {
                            Label("About", systemImage: "info.circle")
                                .labelButtonIcon()
                        }
                        .padding()
                        Spacer()
                        NavigationLink(destination: SettingsView()) {
                            Label("Settings", systemImage: "gearshape")
                                .labelButtonIcon()
                        }
                        .padding()
                    }//:HStack
                    
                    VStack {
                        CircleImageView(imageUrl: viewModel.myUserInfo?.avatar?.large, size: avatarSize)
                            .shadow(radius: 7)
                        
                        Text(viewModel.myUserInfo?.name ?? "")
                            .font(.title2)
                            .bold()
                            .frame(alignment: .center)
                    }//:VStack
                    .offset(y: -125)
                    
                    Spacer()
                    
                }//:VStack
            }//:VScrollView
            .ignoresSafeArea(edges: .top)
            .onAppear {
                viewModel.getMyUserInfo()
            }
        }//:NavigationView
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
