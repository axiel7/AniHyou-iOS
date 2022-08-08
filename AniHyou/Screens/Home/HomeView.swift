//
//  AnimesView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

extension Text {
    
    func sectionTitle() -> some View {
        self
            .font(.title2)
            .bold()
            .padding(.top, 8)
            .padding(.leading, 15)
    }
}

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @State private var showingNotificationsSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    // MARK: Airing section
                    Text("Airing Soon")
                        .sectionTitle()
                    ZStack {
                        if viewModel.airingAnimes.count == 0 {
                            Text("No anime for today\n(*´-`)")
                                .multilineTextAlignment(.center)
                                .frame(alignment: .center)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(viewModel.airingAnimes, id: \.?.media?.id) {
                                    if let item = $0 {
                                        NavigationLink(destination: MediaDetailsView(mediaId: item.media!.id)) {
                                            HListItemWithSubtitleView(title: item.media?.title?.romaji, subtitle: "Airing in \(item.timeUntilAiring.timestampToLegibleText())", imageUrl: item.media?.coverImage?.large)
                                                .padding(.leading, 8)
                                                .frame(width: 280, alignment: .leading)
                                        }
                                    }
                                }
                            }//:HStack
                            .padding(.leading, 8)
                        }//:HScrollView
                        .frame(height: 145)
                        .onAppear {
                            viewModel.getAiringAnimes()
                        }
                    }//:ZStack
                    
                    // MARK: season section
                    Text("\(viewModel.nowSeason.localizedName) \(String(viewModel.nowYear))")
                        .sectionTitle()
                    ZStack {
                        if viewModel.seasonAnimes.count == 0 {
                            ProgressView()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(viewModel.seasonAnimes, id: \.?.id) {
                                    if let item = $0 {
                                        NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                                            VListItemView(title: item.title?.romaji ?? "", imageUrl: item.coverImage?.large)
                                        }
                                    }
                                }
                            }//:HStack
                            .padding(.leading, 8)
                        }//:HScrollView
                        .frame(height: 165)
                        .onAppear {
                            viewModel.getSeasonAnimes()
                        }
                    }//:ZStack
                    
                    //MARK: trending section
                    Text("Trending Now")
                        .sectionTitle()
                    ZStack {
                        if viewModel.trendingAnimes.count == 0 {
                            ProgressView()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(viewModel.trendingAnimes, id: \.?.id) {
                                    if let item = $0 {
                                        NavigationLink(destination: MediaDetailsView(mediaId: item.id)) {
                                            VListItemView(title: item.title?.romaji ?? "", imageUrl: item.coverImage?.large)
                                        }
                                    }
                                }
                            }//:HStack
                            .padding(.leading, 8)
                        }//:HScrollView
                        .frame(height: 165)
                        .onAppear {
                            viewModel.getTrendingAnimes()
                        }
                    }//:ZStack
                }//:VStack
            }//:VScrollView
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingNotificationsSheet = true
                    } label: {
                        Label("Notifications", systemImage: "bell")
                    }
                    .sheet(isPresented: $showingNotificationsSheet) {
                        NotificationsView()
                    }
                }
            }
        }//:NavigationView
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
