//
//  MediaRelationsAndRecommendationsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI

struct MediaRelationsAndRecommendationsView: View {

    let mediaId: Int
    @StateObject private var viewModel = RelationRecommendationViewModel()

    var body: some View {
        if let relationsAndRecommendations = viewModel.mediaRelationsAndRecommendations {
            VStack(alignment: .leading) {

                if relationsAndRecommendations.relations?.edges?.count ?? 0 > 0 {
                    // MARK: Relations
                    Text("Relations")
                        .font(.title3)
                        .bold()
                        .padding(.leading)

                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(relationsAndRecommendations.relations?.edges ?? [],
                                    id: \.?.node?.id
                            ) {
                                if let relation = $0 {
                                    NavigationLink(destination: MediaDetailsView(mediaId: relation.node!.id)) {
                                        HListItemWithSubtitleView(
                                            title: relation.node?.title?.userPreferred,
                                            twoSubtitleTexts: (
                                                relation.relationType?.value?.localizedName,
                                                relation.node?.format?.value?.localizedName
                                            ),
                                            imageUrl: relation.node?.coverImage?.large,
                                            status: relation.node?.mediaListEntry?.status?.value
                                        )
                                        .padding(.leading)
                                        .frame(width: 280, alignment: .leading)
                                        .mediaContextMenu(
                                            mediaId: relation.node!.id,
                                            mediaType: relation.node?.type?.value,
                                            mediaListStatus: relation.node?.mediaListEntry?.status?.value
                                        )
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }//HStack
                    }//:HScrollView
                    .frame(height: HListItemWithSubtitleView.coverHeight)
                    .padding(.bottom)
                }

                // MARK: Recommendations
                Text("Recommendations")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                ZStack(alignment: .center) {
                    if relationsAndRecommendations.recommendations?.nodes?.count == 0 {
                        Text("No recommendations")
                            .padding(.vertical)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(relationsAndRecommendations.recommendations?.nodes ?? [],
                                    id: \.?.mediaRecommendation?.id
                            ) {
                                if let recommendation = $0?.mediaRecommendation {
                                    NavigationLink(destination: MediaDetailsView(
                                        mediaId: recommendation.id)
                                    ) {
                                        VListItemView(
                                            title: recommendation.title?.userPreferred ?? "",
                                            imageUrl: recommendation.coverImage?.large,
                                            status: recommendation.mediaListEntry?.status?.value
                                        )
                                        .padding(.trailing, 4)
                                        .mediaContextMenu(
                                            mediaId: recommendation.id,
                                            mediaType: recommendation.type?.value,
                                            mediaListStatus: recommendation.mediaListEntry?.status?.value
                                        )
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }//:HStack
                        .padding(.leading)
                    }//:HScrollView
                }//:Group
                .padding(.bottom)
            }//:VStack
        } else {
            HorizontalProgressView()
                .padding()
                .onAppear {
                    viewModel.getMediaRelationsAndRecommendations(mediaId: mediaId)
                }
        }
    }
}

#Preview {
    NavigationStack {
        MediaRelationsAndRecommendationsView(mediaId: 1)
    }
}
