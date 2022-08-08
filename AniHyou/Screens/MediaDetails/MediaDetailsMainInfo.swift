//
//  MediaDetailsMainInfo.swift
//  AniHyou
//
//  Created by Axel Lopez on 23/7/22.
//

import SwiftUI

private let coverWidth: CGFloat = 100
private let coverHeight: CGFloat = 153

struct MediaDetailsMainInfo: View {
    
    @ObservedObject var viewModel: MediaDetailsViewModel
    @State private var showingEditSheet = false
    @State private var showingCoverSheet = false
    @State private var showingNotLoggedAlert = false
    @State private var showingPlayPopover = false
    
    var body: some View {
        HStack(alignment: .top) {
            
            MediaCoverView(imageUrl: viewModel.mediaDetails!.coverImage?.large, width: coverWidth, height: coverHeight)
                .sheet(isPresented: $showingCoverSheet) {
                    FullCoverView(imageUrl: viewModel.mediaDetails!.coverImage?.extraLarge)
                }
                .onTapGesture {
                    showingCoverSheet = true
                }
            
            VStack(alignment: .leading) {
                
                Text(viewModel.mediaDetails!.title?.romaji ?? "")
                    .font(.title3)
                    .bold()
                    .lineLimit(3)
                    .padding(.bottom, 1)
                
                Text(viewModel.mediaDetails!.format?.localizedName ?? "Unknown")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                HStack {
                    //MARK: Status button
                    Button {
                        if isLoggedIn() {
                            showingEditSheet = true
                        } else {
                            showingNotLoggedAlert = true
                        }
                    } label: {
                        Text(viewModel.mediaDetails!.mediaListEntry?.status?.localizedName ?? "Add to List")
                            .bold()
                            .textCase(.uppercase)
                    }//:Button
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showingEditSheet) {
                        MediaListEditView(mediaId: viewModel.mediaId, mediaType: viewModel.mediaDetails!.type!, mediaList: viewModel.mediaDetails!.mediaListEntry)
                    }
                    .alert("Please login to use this feature", isPresented: $showingNotLoggedAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    Spacer()
                    
                    //MARK: Streaming button
                    if !viewModel.streamingLinks.isEmpty {
                        Button {
                            showingPlayPopover = true
                        } label: {
                            Label("Play", systemImage: "play.circle")
                                .labelButtonIcon()
                        }
                        .padding()
                        .confirmationDialog("Streaming sites", isPresented: $showingPlayPopover) {
                            ForEach(viewModel.streamingLinks, id: \.?.id) { item in
                                if item != nil {
                                    Link(item!.site, destination: URL(string: item!.url ?? "")!)
                                }
                            }
                        }
                    }
                }
            }//:VStack
            .padding(.leading, 12)
            .padding(.trailing, 8)
        }//:HStack
        .padding(.top)
        .padding(.leading)
    }
}

struct MediaDetailsMainInfo_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailsMainInfo(viewModel: MediaDetailsViewModel(mediaId: 140960))
    }
}
