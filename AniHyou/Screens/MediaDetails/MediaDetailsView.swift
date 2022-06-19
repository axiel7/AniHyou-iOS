//
//  MediaDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/6/22.
//

import SwiftUI

struct MediaDetailsView: View {
    
    var mediaId: Int
    @StateObject private var viewModel = MediaDetailsViewModel()
    private let coverWidth: CGFloat = 100
    private let coverHeight: CGFloat = 153
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                StickyHeader {
                    ZStack {
                        AsyncImage(url: URL(string: viewModel.mediaDetails?.bannerImage ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                                Image("Square")
                                    .resizable()
                                    .foregroundColor(Color(viewModel.mediaDetails?.coverImage?.color) ?? .gray)
                        }
                        Rectangle()
                            .foregroundColor(.clear)
                            .background {
                                LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.4)]), startPoint: .bottom, endPoint: .top)
                                    .padding(.bottom, 19)
                            }
                    }
                }//:StickyHeader
                
                HStack(alignment: .top) {
                    
                    MediaCoverView(imageUrl: viewModel.mediaDetails?.coverImage?.large, width: coverWidth, height: coverHeight)
                        .shadow(radius: 7)
                    
                    VStack(alignment: .leading) {
                        
                        Text(viewModel.mediaDetails?.title?.romaji ?? "")
                            .font(.title3)
                            .bold()
                            .lineLimit(3)
                            .padding(.bottom, 1)
                        
                        Text(viewModel.mediaDetails?.format?.localizedName ?? "Unknown")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("Watching")
                                .bold()
                                .textCase(.uppercase)
                        }
                        .buttonStyle(.borderedProminent)
                    }//:VStack
                    .padding(.leading, 12)
                    .padding(.trailing, 8)
                    
                    Spacer()
                }//:HStack
                .padding(.top)
                .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack {
                        Divider()
                        HStack {
                            MediaStatView(statTitle: "Average Score", statValue: "\(viewModel.mediaDetails?.averageScore ?? 0)%")
                            MediaStatView(statTitle: "Mean Score", statValue: "\(viewModel.mediaDetails?.meanScore ?? 0)%")
                            MediaStatView(statTitle: "Status", statValue: viewModel.mediaDetails?.status?.localizedName ?? "Unknown")
                            MediaStatView(statTitle: "Popularity", statValue: String(viewModel.mediaDetails?.popularity ?? 0))
                            
                        }
                        .padding(.top, 4)
                        .padding(.bottom, 4)
                        Divider()
                    }//:VStack
                    .padding(.leading)
                }//:HScrollView
                .padding(.top)
                
                ExpandableTextView(viewModel.mediaDetails?.description?.htmlStripped)
                    .padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                
                Spacer()
            }//:VStack
        }//:VScrollView
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            viewModel.getMediaDetails(id: mediaId)
        }
    }
}

struct MediaDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailsView(mediaId: 125367)
    }
}
