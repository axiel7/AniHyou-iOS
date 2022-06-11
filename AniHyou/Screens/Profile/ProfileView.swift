//
//  ProfileView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/6/22.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    private let avatarSize: CGFloat = 110
    private let bannerHeight: CGFloat = 150
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                AsyncImage(url: URL(string: viewModel.userInfo?.bannerImage ?? "")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: bannerHeight)
                    } else {
                        Image("Square")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.gray)
                            .frame(height: bannerHeight)
                    }
                }
                .ignoresSafeArea()
                
                VStack {
                    AsyncImage(url: URL(string: viewModel.userInfo?.avatar?.large ?? "")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .clipShape(Circle())
                                .shadow(radius: 7)
                                .frame(width: avatarSize, height: avatarSize, alignment: .center)
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .shadow(radius: 7)
                                .frame(width: avatarSize, height: avatarSize, alignment: .center)
                        }
                    }
                    
                    Text(viewModel.userInfo?.name ?? "axiel7")
                        .font(.title2)
                        .frame(alignment: .center)
                }//:VStack
                .offset(y: -20)
                
                Spacer()
            }//:VStack
        }//:VScrollView
        .onAppear {
            viewModel.getUserInfo()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            ProfileView()
                .tabItemProfile()
        }
    }
}
