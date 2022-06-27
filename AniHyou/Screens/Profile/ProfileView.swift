//
//  ProfileView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    private let avatarSize: CGFloat = 110
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                TopBannerView(imageUrl: viewModel.userInfo?.bannerImage, placeholderHexColor: viewModel.userInfo?.hexColor, height: 150)
                
                VStack {
                    KFImage(URL(string: viewModel.userInfo?.avatar?.large ?? ""))
                        .placeholder {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .shadow(radius: 7)
                                .frame(width: avatarSize, height: avatarSize, alignment: .center)
                        }
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius: 7)
                        .frame(width: avatarSize, height: avatarSize, alignment: .center)
                    
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
