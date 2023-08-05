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
        Group {
            if mediaListStatus == nil || mediaListStatus == .none {
                Button {
                    // call a model or service to run
                    setStatus(mediaId: mediaId, status: .planning)
                } label: {
                    Label("Add to Planning", systemImage: "text.badge.plus")
                }
            }
            if mediaListStatus == .current || mediaListStatus == .repeating {
                Button {
                    setStatus(mediaId: mediaId, status: .completed)
                } label: {
                    Label("Complete", systemImage: "text.badge.checkmark")
                }
                Button {
                    setStatus(mediaId: mediaId, status: .dropped)
                } label: {
                    Label("Drop", systemImage: "text.badge.xmark")
                }
                Button {
                    setStatus(mediaId: mediaId, status: .paused)
                } label: {
                    Label("Pause", systemImage: "pause.fill")
                }
            }
            if mediaListStatus == .completed {
                Button {
                    setStatus(mediaId: mediaId, status: .repeating)
                } label: {
                    Label("Repeat", systemImage: "repeat")
                }
            }
            if mediaListStatus == .paused || mediaListStatus == .dropped || mediaListStatus == .planning {
                Button {
                    setStatus(mediaId: mediaId, status: .current)
                } label: {
                    Label("Watching", systemImage: "play")
                }
            }
        }
    }
    
    func setStatus(mediaId: Int, status: MediaListStatus) {
        let repo = MediaRepository()
        repo.updateList(mediaId: mediaId, status: status)
    }

    func mediaContextMenu(mediaId: Int, mediaType: MediaType?, mediaListStatus: MediaListStatus? = nil) -> some View {
        Group {
            if #available(iOS 16.0, *) {
                self
                    .contextMenu {
                        if mediaType != nil {
                            contextActions(mediaId: mediaId, mediaListStatus: mediaListStatus)
                            ShareLink(item: "\(mediaType!.mediaUrl)\(mediaId)") {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                            .padding(.trailing)
                            .labelStyle(.iconOnly)
                        }
                    } preview: {
                        MediaContextMenuView(mediaId: mediaId)
                    }
            } else {
                self
                    .contextMenu {
                        if mediaType != nil {
                            contextActions(mediaId: mediaId, mediaListStatus: mediaListStatus)
                            Button {
                                shareSheet(url: "\(mediaType!.mediaUrl)\(mediaId)")
                            } label: {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                            .labelStyle(.iconOnly)
                        }
                    }
            }
        }
    }
}

struct MediaContextMenuView: View {
    
    var mediaId: Int
    @StateObject private var viewModel = MediaContextMenuViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.details == nil {
                VStack(alignment: .center) {
                    ProgressView()
                        .onAppear {
                            viewModel.getDetails(mediaId: mediaId)
                        }
                }
            } else {
                HStack(alignment: .center) {
                    MediaCoverView(imageUrl: viewModel.details!.coverImage?.large, width: 90, height: 130)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(viewModel.details!.title?.userPreferred ?? "")
                            .font(.system(size: 17))
                            .bold()
                            .lineLimit(3)
                            .padding(.bottom, 1)
                        
                        Label("\(viewModel.details!.meanScore ?? 0)%", systemImage: "star.fill")
                            .foregroundColor(ScoreFormat.point100.scoreColor(
                                score: Double(viewModel.details?.meanScore ?? 0)
                            ))
                            .font(.subheadline)
                        
                        Text(viewModel.details!.format?.value?.localizedName ?? "Unknown")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        if let episodes = viewModel.details!.episodes {
                            Text("\(episodes) episodes")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        if let chapters = viewModel.details!.chapters {
                            Text("\(chapters) chapters")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        if let volumes = viewModel.details!.volumes {
                            Text("\(volumes) volumes")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        if let schedule = viewModel.details!.nextAiringEpisode {
                            HStack(spacing: 1) {
                                Text("Ep \(schedule.episode) in ")
                                Text(Date(timeIntervalSince1970: Double(schedule.airingAt)), style: .relative)
                            }
                            .font(.subheadline)
                        }
                    }
                }//:HStack
            }
        }//:ZStack
        .transition(.opacity)
        .frame(width: 300, height: 150)
        .padding(.vertical)
        .padding(.horizontal, 4)
    }
}

struct MediaContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MediaContextMenuView(mediaId: 1)
    }
}
