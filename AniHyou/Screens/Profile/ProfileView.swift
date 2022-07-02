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
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                TopBannerView(imageUrl: viewModel.userInfo?.bannerImage, placeholderHexColor: viewModel.userInfo?.hexColor, height: bannerHeight)
                
                VStack {
                    CircleImageView(imageUrl: viewModel.userInfo?.avatar?.large, size: avatarSize)
                        .shadow(radius: 7)
                    
                    Text(viewModel.userInfo?.name ?? "axiel7")
                        .font(.title2)
                        .bold()
                        .frame(alignment: .center)
                }//:VStack
                .offset(y: -65)
                
                Spacer()
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
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}
