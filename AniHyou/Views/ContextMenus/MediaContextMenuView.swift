//
//  MediaContextMenu.swift
//  AniHyou
//
//  Created by Axel Lopez on 12/07/2023.
//

import SwiftUI
import AniListAPI

extension View {

    func contextActions(mediaId: Int, mediaListStatus: MediaListStatus?) -> some View {
        ForEach(statusesCanChangeTo(mediaListStatus), id: \.rawValue) { status in
            Button {
                MediaListRepository.updateListStatus(mediaId: mediaId, status: status)
            } label: {
                Label(status.localizedName, systemImage: status.systemImage)
            }
        }
    }
    
    func statusesCanChangeTo(_ status: MediaListStatus?) -> [MediaListStatus] {
        switch status {
        case nil:
            return [.planning]
        case .current, .repeating:
            return [.completed, .dropped, .paused]
        case .completed:
            return [.repeating]
        case .paused, .dropped, .planning:
            return [.current]
        }
    }

    func mediaContextMenu(mediaId: Int, mediaType: MediaType?, mediaListStatus: MediaListStatus?) -> some View {
        Group {
            self
                .contextMenu {
                    if let mediaType {
                        contextActions(mediaId: mediaId, mediaListStatus: mediaListStatus)
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
                            .foregroundColor(ScoreFormat.point100.scoreColor(
                                score: Double(details.meanScore ?? 0)
                            ))
                            .font(.subheadline)
                        
                        Text(details.format?.value?.localizedName ?? "Unknown")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        if let episodes = details.episodes {
                            Text("\(episodes) episodes")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        if let chapters = details.chapters {
                            Text("\(chapters) chapters")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        if let volumes = details.volumes {
                            Text("\(volumes) volumes")
                                .font(.subheadline)
                                .foregroundColor(.gray)
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
