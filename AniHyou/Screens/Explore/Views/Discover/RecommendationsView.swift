//
//  RecommendationsView.swift
//  AniHyou
//
//  Created by Axel on 26/08/2026.
//

import SwiftUI
import AniListAPI

struct RecommendationsView: View {
    
    @Bindable var viewModel: RecommendationsViewModel
    @AppStorage(BLUR_ADULT_MEDIA) private var blurAdultMedia = true
    
    var body: some View {
        ForEach(viewModel.recommendations, id: \.self) { item in
            ItemView(
                item: item,
                blurAdultMedia: blurAdultMedia,
                onVoteUp: { await viewModel.saveRating(item, rating: .rateUp) },
                onVoteDown: { await viewModel.saveRating(item, rating: .rateDown) }
            )
        }
        .padding(.top)
        VStack {
            if viewModel.hasNextPage || viewModel.isLoading {
                HorizontalProgressView()
                    .padding()
                    .task {
                        if viewModel.hasNextPage {
                            await viewModel.getRecommendations()
                        }
                    }
            }
        }
        .task {
            if viewModel.recommendations.isEmpty {
                await viewModel.getRecommendations()
            }
        }
    }
}

private struct ItemView: View {
    
    let item: CommonRecommendation
    let blurAdultMedia: Bool
    let onVoteUp: () async -> Void
    let onVoteDown: () async -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            if let media = item.media {
                NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                    MediaItemHorizontal(
                        coverImage: media.coverImage?.large,
                        listStatus: media.mediaListEntry?.status?.value,
                        position: nil,
                        title: media.title?.userPreferred ?? "",
                        mediaFormat: media.format?.value,
                        year: media.startDate?.year,
                        mediaStatus: media.status?.value,
                        meanScore: media.meanScore,
                        episodes: media.episodes,
                        chapters: media.chapters,
                        duration: media.duration,
                        genres: media.genres,
                        blurCover: blurAdultMedia && media.isAdult == true
                    )
                    .mediaContextMenu(
                        mediaId: media.id,
                        mediaType: media.type?.value,
                        mediaListStatus: media.mediaListEntry?.status?.value
                    )
                }
                .buttonStyle(.plain)
            }
            
            if let mediaRec = item.mediaRecommendation {
                NavigationLink(destination: MediaDetailsView(mediaId: mediaRec.id)) {
                    MediaItemHorizontal(
                        coverImage: mediaRec.coverImage?.large,
                        listStatus: mediaRec.mediaListEntry?.status?.value,
                        position: nil,
                        title: mediaRec.title?.userPreferred ?? "",
                        mediaFormat: mediaRec.format?.value,
                        year: mediaRec.startDate?.year,
                        mediaStatus: mediaRec.status?.value,
                        meanScore: mediaRec.meanScore,
                        episodes: mediaRec.episodes,
                        chapters: mediaRec.chapters,
                        duration: mediaRec.duration,
                        genres: mediaRec.genres,
                        blurCover: blurAdultMedia && mediaRec.isAdult == true
                    )
                    .mediaContextMenu(
                        mediaId: mediaRec.id,
                        mediaType: mediaRec.type?.value,
                        mediaListStatus: mediaRec.mediaListEntry?.status?.value
                    )
                }
                .buttonStyle(.plain)
            }
            
            HStack(spacing: 8) {
                Spacer()
                Button {
                    Task { await onVoteUp() }
                } label: {
                    let image = if item.userRating?.value == .rateUp {
                        "hand.thumbsup.fill"
                    } else {
                        "hand.thumbsup"
                    }
                    Label(item.rating?.formatted() ?? "", systemImage: image)
                }
                
                Button {
                    Task { await onVoteDown() }
                } label: {
                    let image = if item.userRating?.value == .rateDown {
                        "hand.thumbsdown.fill"
                    } else {
                        "hand.thumbsdown"
                    }
                    Image(systemName: image)
                }
                Spacer()
            }
        }
        .frame(width: 350)
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

#Preview {
    RecommendationsView(viewModel: RecommendationsViewModel())
}
