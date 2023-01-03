//
//  StudioDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 03/01/2023.
//

import SwiftUI

struct StudioDetailsView: View {
    
    var studioId: Int
    @StateObject private var viewModel = StudioDetailsViewModel()
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 20))
    ]
    
    var body: some View {
        if viewModel.studioName != nil {
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Text(viewModel.studioName!)
                            .font(.title)
                        Spacer()
                        Label("\(viewModel.studioFavorites ?? 0)", systemImage: "heart")
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: gridColumns) {
                        ForEach(viewModel.studioMedia, id: \.?.id) { item in
                            NavigationLink(destination: MediaDetailsView(mediaId: item!.id)) {
                                VListItemView(title: item?.title?.userPreferred ?? "", imageUrl: item?.coverImage?.large)
                            }
                        }
                        
                        if viewModel.hasNextPage {
                            ProgressView()
                                .onAppear {
                                    viewModel.getStudioDetails(studioId: studioId)
                                }
                        }
                    }//:VGrid
                }//:VStack
            }//:VScrollView
        } else {
            ProgressView()
                .onAppear {
                    viewModel.getStudioDetails(studioId: studioId)
                }
        }
    }
}

struct StudioDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StudioDetailsView(studioId: 1)
    }
}
