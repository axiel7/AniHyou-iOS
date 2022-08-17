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
                
                if viewModel.mediaRelationsAndRecommendations?.relations?.edges?.count ?? 0 > 0 {
                    //MARK: Relations
                    Text("Relations")
                        .font(.title3)
                        .bold()
                        .padding(.leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.mediaRelationsAndRecommendations?.relations?.edges ?? [], id: \.?.node?.id) {
                                if let relation = $0 {
                                    NavigationLink(destination: MediaDetailsView(mediaId: relation.node!.id)) {
                                        HListItemWithSubtitleView(title: relation.node?.title?.userPreferred, subtitle: "\(relation.relationType?.localizedName ?? "") · \(relation.node?.format?.localizedName ?? "")", imageUrl: relation.node?.coverImage?.large)
                                            .padding(.leading)
                                            .frame(width: 280, alignment: .leading)
                                    }
                                }
                            }
                        }//HStack
                    }//:HScrollView
                    .frame(height: HListItemWithSubtitleView.coverHeight)
                    .padding(.bottom)
                }
                
                //MARK: Recommendations
                Text("Recommendations")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                ZStack {
                    if viewModel.mediaRelationsAndRecommendations == nil {
                        ProgressView()
                            .padding(.top)
                    } else if viewModel.mediaRelationsAndRecommendations?.recommendations?.nodes?.count == 0 {
                        Text("No recommendations")
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.mediaRelationsAndRecommendations?.recommendations?.nodes ?? [], id: \.?.mediaRecommendation?.id) {
                                if let recommendation = $0?.mediaRecommendation {
                                    NavigationLink(destination: MediaDetailsView(mediaId: recommendation.id)) {
                                        VListItemView(title: recommendation.title?.userPreferred ?? "", imageUrl: recommendation.coverImage?.large)
                                    }
                                }
                            }
                        }//:HStack
                        .padding(.leading, 8)
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
