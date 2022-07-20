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

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showLogOutDialog = false
    @Binding var justLogged: Bool
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                TopBannerView(imageUrl: viewModel.userInfo?.bannerImage, placeholderHexColor: viewModel.userInfo?.hexColor, height: bannerHeight)
                
                VStack {
                    CircleImageView(imageUrl: viewModel.userInfo?.avatar?.large, size: avatarSize)
                        .shadow(radius: 7)
                    
                    Text(viewModel.userInfo?.name ?? "")
                        .font(.title2)
                        .bold()
                        .frame(alignment: .center)
                }//:VStack
                .offset(y: -65)
                
                Spacer()
                
                Button("Log out") {
                    showLogOutDialog = true
                }
                .buttonStyle(.bordered)
                .confirmationDialog("Are you sure you want to log out?", isPresented: $showLogOutDialog) {
                    Button("Log out", role: .destructive) {
                        viewModel.logOut()
                        justLogged = false
                    }
                } message: {
                    Text("Are you sure you want to log out?")
                }
            }//:VStack
        }//:VScrollView
        .ignoresSafeArea(edges: .top)
        .onAppear {
            viewModel.getUserInfo()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            ProfileView(justLogged: .constant(false))
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}
