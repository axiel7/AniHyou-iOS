//
//  ExploreView.swift
//  AniHyou
//
//  Created by Axel Lopez on 26/6/22.
//

import SwiftUI

struct ExploreView: View {
    
    @State var searchText: String = ""
    private let cardHeight: CGFloat = 90
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    
                    Text("Top")
                        .font(.title2)
                        .bold()
                        .padding(.top, 8)
                        .padding(.leading, 15)
                    Divider()
                        .padding(.leading)
                        .padding(.trailing)
                    
                    HStack(alignment: .center) {
                        NavigationLink(destination: MediaChartListView(title: "Top 100 Anime", type: .anime, sort: .scoreDesc)) {
                            RectangleTextView(text: "Top 100 Anime", color: Color("AniListBlue"))
                                .padding(.leading)
                                .frame(maxWidth: .infinity, minHeight: cardHeight)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        NavigationLink(destination: MediaChartListView(title: "Top 100 Manga", type: .manga, sort: .scoreDesc)) {
                            RectangleTextView(text: "Top 100 Manga", color: Color("AniListGreen"))
                                .padding(.trailing)
                                .frame(maxWidth: .infinity, minHeight: cardHeight)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }//:HStack
                    
                    HStack(alignment: .center) {
                        NavigationLink(destination: MediaChartListView(title: "Popular Anime", type: .anime, sort: .popularityDesc)) {
                            RectangleTextView(text: "Popular Anime", color: Color("AniListOrange"))
                                .padding(.leading)
                                .frame(maxWidth: .infinity, minHeight: cardHeight)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        NavigationLink(destination: MediaChartListView(title: "Popular Manga", type: .manga, sort: .popularityDesc)) {
                            RectangleTextView(text: "Popular Manga", color: Color("AniListRed"))
                                .padding(.trailing)
                                .frame(maxWidth: .infinity, minHeight: cardHeight)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }//:HStack
                    
                }//:VStack
            }//:VScrollView
            .searchable(text: $searchText, placement: .toolbar, prompt: "Anime, Manga, and More") {
                
            }
            .navigationTitle("Explore")
        }//:NavigationView
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
