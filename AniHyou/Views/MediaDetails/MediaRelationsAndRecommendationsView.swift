//
//  MediaRelationsAndRecommendationsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI

struct MediaRelationsAndRecommendationsView: View {
    
    @ObservedObject var viewModel: MediaDetailsViewModel
    
    var body: some View {
        if viewModel.mediaRelationsAndRecommendations != nil {
            VStack(alignment: .leading) {
                
                //MARK: Relations
                Text("Relations")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                ZStack {
                    if viewModel.mediaRelationsAndRecommendations == nil {
                        ProgressView()
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.mediaRelationsAndRecommendations?.relations?.edges ?? [], id: \.?.node?.id) {
                                if let relation = $0 {
                                    NavigationLink(destination: MediaDetailsView(mediaId: relation.node!.id)) {
                                        HListItemWithSubtitleView(title: relation.node?.title?.romaji, subtitle: "\(relation.relationType?.formatted ?? "") · \(relation.node?.format?.formatted ?? "")", imageUrl: relation.node?.coverImage?.large)
                                            .frame(maxWidth: 280)
                                    }
                                    .padding(.trailing)
                                }
                            }
                        }//HStack
                    }//:HScrollView
                }//:ZStack
                .frame(height: HListItemWithSubtitleView.coverHeight)
                .padding(.bottom)
                
                //MARK: Recommendations
                Text("Recommendations")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                ZStack {
                    if viewModel.mediaRelationsAndRecommendations == nil {
                        ProgressView()
                            .padding(.top)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.mediaRelationsAndRecommendations?.recommendations?.nodes ?? [], id: \.?.mediaRecommendation?.id) {
                                if let recommendation = $0?.mediaRecommendation {
                                    NavigationLink(destination: MediaDetailsView(mediaId: recommendation.id)) {
                                        VListItemView(title: recommendation.title?.romaji ?? "", imageUrl: recommendation.coverImage?.large)
                                    }
                                }
                            }
                        }//:HStack
                        .padding(.leading, 4)
                    }//:HScrollView
                }//:ZStack
                .padding(.bottom)
            }//:VStack
        } else {
            HStack {
                Spacer()
                ProgressView()
                    .padding()
                Spacer()
            }
        }
    }
}

struct MediaRelationsAndRecommendationsView_Previews: PreviewProvider {
    static var previews: some View {
        MediaRelationsAndRecommendationsView(viewModel: MediaDetailsViewModel())
    }
}
