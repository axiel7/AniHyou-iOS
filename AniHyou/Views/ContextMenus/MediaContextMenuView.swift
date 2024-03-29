//
//  MediaContextMenu.swift
//  AniHyou
//
//  Created by Axel Lopez on 12/07/2023.
//

import SwiftUI
import AniListAPI

extension View {

    private func statusSetActions(
        mediaId: Int,
        mediaListStatus: MediaListStatus?
    ) -> some View {
        ForEach(mediaListStatus.statusesCanChangeTo, id: \.rawValue) { status in
            Button {
                MediaListRepository.updateListStatus(mediaId: mediaId, status: status)
            } label: {
                let localizedKey = String.LocalizationValue(
                    stringLiteral: status.localizedStringKey
                )
                Label("Set as \(String(localized: localizedKey))", systemImage: status.systemImage)
            }
        }
    }

    func mediaContextMenu(
        mediaId: Int,
        mediaType: MediaType?,
        mediaListStatus: MediaListStatus?
    ) -> some View {
        self.contextMenu {
            if let mediaType {
                statusSetActions(mediaId: mediaId, mediaListStatus: mediaListStatus)
                ShareLink(item: "\(mediaType.mediaUrl)\(mediaId)") {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                .padding(.trailing)
                .labelStyle(.iconOnly)
            }
        } preview: {
            MediaContextMenuView(mediaId: mediaId)
        }
    }
}

struct MediaContextMenuView: View {
    
    var mediaId: Int
    @StateObject private var viewModel = MediaContextMenuViewModel()
    
    var body: some View {
        ZStack {
            if let details = viewModel.details {
                HStack(alignment: .center) {
                    MediaCoverView(imageUrl: details.coverImage?.large, width: 90, height: 130)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(details.title?.userPreferred ?? "")
                            .font(.system(size: 17))
                            .bold()
                            .lineLimit(3)
                            .padding(.bottom, 1)
                        
                        Label("\(details.meanScore ?? 0)%", systemImage: "star.fill")
                            .foregroundStyle(ScoreFormat.point100.color(score: details.meanScore))
                            .font(.subheadline)
                        
                        Text(details.format?.value?.localizedName ?? "Unknown")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        if let episodes = details.episodes {
                            Text("\(episodes) episodes")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        
                        if let chapters = details.chapters {
                            Text("\(chapters) chapters")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        
                        if let volumes = details.volumes {
                            Text("\(volumes) volumes")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        
                        if let schedule = details.nextAiringEpisode {
                            AiringText(episode: schedule.episode, airingAt: schedule.airingAt)
                                .font(.subheadline)
                        }
                    }
                }//:HStack
            } else {
                VStack(alignment: .center) {
                    ProgressView()
                        .onAppear {
                            viewModel.getDetails(mediaId: mediaId)
                        }
                }
            }
        }//:ZStack
        .transition(.opacity)
        .frame(width: 300, height: 150)
        .padding(.vertical)
        .padding(.horizontal, 4)
    }
}

#Preview {
    MediaContextMenuView(mediaId: 1)
}
