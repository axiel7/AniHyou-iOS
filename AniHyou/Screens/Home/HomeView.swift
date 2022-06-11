//
//  AnimesView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @State private var queryString = ""
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    // MARK: Airing section
                    Text("Airing Today")
                        .font(.title2)
                        .bold()
                        .padding(.top, 8)
                        .padding(.leading, 15)
                    ZStack {
                        if viewModel.todaySchedules.count == 0 {
                            Text("No animes for today")
                                .frame(alignment: .center)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(viewModel.todaySchedules, id: \.?.media?.id) {
                                    let item = $0
                                    HListItemWithSubtitleView(title: item?.media?.title?.romaji ?? "", subtitle: "Airing in \(timestampToHoursOrMinutes(ms: item?.timeUntilAiring))", imageUrl: item?.media?.coverImage?.large)
                                }
                            }
                        }//:HScrollView
                        .frame(height: 145)
                        .onAppear {
                            viewModel.getAiringAnimes()
                        }
                    }//:ZStack
                    
                    // MARK: season section
                    Text("\(viewModel.nowSeason.localizedName) \(String(viewModel.nowYear))")
                        .font(.title2)
                        .bold()
                        .padding(.top, 8)
                        .padding(.leading, 15)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.seasonAnimes, id: \.?.id) {
                                let item = $0
                                VListItemView(title: item?.title?.romaji ?? "", imageUrl: item?.coverImage?.large)
                            }
                        }
                    }//:HScrollView
                    .onAppear {
                        viewModel.getSeasonAnimes()
                    }
                    
                }//:VStack
            }//:VScrollView
            .navigationTitle("Home")
        }//:NavigationView
    }
    
    private func timestampToHoursOrMinutes(ms: Int?) -> String {
        guard let ms = ms else {
            return "0 h"
        }

        let hours = ms / 3600
        if hours < 1 {
            let minutes = (ms % 3600) / 60
            return "\(minutes) min"
        }
        return "\(hours) h"
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
