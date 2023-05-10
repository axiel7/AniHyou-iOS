//
//  MediaMultimediaView.swift
//  AniHyou
//
//  Created by Axel Lopez on 10/05/2023.
//

import SwiftUI



struct MediaMultimediaView: View {
    
    @ObservedObject var viewModel: MediaDetailsViewModel
    private let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                //MARK: - Trailer
                if let trailer = viewModel.mediaDetails?.trailer {
                    if viewModel.trailerLink != nil {
                        Text("Trailer")
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                        
                        Link(destination: URL(string: viewModel.trailerLink!)!) {
                            VideoThumbnailView(imageUrl: trailer.thumbnail)
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
                
                //MARK: - Streaming episodes
                if let episodes = viewModel.mediaDetails?.streamingEpisodes {
                    if !episodes.isEmpty {
                        Text("Episodes")
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(episodes, id: \.?.url) {
                                    if let item = $0 {
                                        VStack {
                                            Link(destination: URL(string: item.url!)!) {
                                                VideoThumbnailView(imageUrl: item.thumbnail)
                                            }
                                            .padding(.bottom, 2)
                                            Text(item.title ?? "")
                                        }
                                        .frame(width: videoWidth)
                                        .padding(.leading)
                                        .padding(.bottom)
                                    }
                                }
                            }
                        }
                    }
                }
                
                //MARK: - Streaming links
                if !viewModel.streamingLinks.isEmpty {
                    Text("Streaming sites")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    LazyVGrid(columns: gridColumns) {
                        ForEach(viewModel.streamingLinks, id: \.?.id) {
                            if let item  = $0 {
                                Link(item.site, destination: URL(string: item.url!)!)
                                    .padding(2)
                            }
                        }
                    }
                }
                
                //MARK: - External links
                if !viewModel.externalLinks.isEmpty {
                    Text("External links")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    LazyVGrid(columns: gridColumns) {
                        ForEach(viewModel.externalLinks, id: \.?.id) {
                            if let item  = $0 {
                                Link(item.site, destination: URL(string: item.url!)!)
                                    .padding(2)
                            }
                        }
                    }
                }
            }//:VStack
        }//:VScrollView
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.mediaDetails?.title?.userPreferred ?? "")
    }
}

struct MediaMultimediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaMultimediaView(viewModel: MediaDetailsViewModel())
    }
}
