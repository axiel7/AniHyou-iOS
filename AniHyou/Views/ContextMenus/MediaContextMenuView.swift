//
//  MediaContextMenu.swift
//  AniHyou
//
//  Created by Axel Lopez on 12/07/2023.
//

import SwiftUI
import AniListAPI

extension View {
    func mediaContextMenu(mediaId: Int, mediaType: MediaType?) -> some View {
        Group {
            if #available(iOS 16.0, *) {
                self
                    .contextMenu {
                        if mediaType != nil {
                            ShareLink(item: "\(mediaType!.mediaUrl)\(mediaId)") {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                            .padding(.trailing)
                            .labelStyle(.iconOnly)
                        }
                    } preview: {
                        VStack(alignment: .leading) {
                            MediaContextMenuView(mediaId: mediaId)
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 4)
                    }
            } else {
                self
                    .contextMenu {
                        if mediaType != nil {
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
        if viewModel.details == nil {
            VStack(alignment: .center) {
                ProgressView()
                    .onAppear {
                        viewModel.getDetails(mediaId: mediaId)
                    }
            }
            .frame(width: 300, height: 200)
        } else {
            HStack(alignment: .center) {
                MediaCoverView(imageUrl: viewModel.details!.coverImage?.large, width: 90, height: 130)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(viewModel.details!.title?.userPreferred ?? "")
                        .font(.title3)
                        .bold()
                        .lineLimit(3)
                        .padding(.bottom, 1)
                    
                    Label("\(viewModel.details!.meanScore ?? 0)%", systemImage: "star.fill")
                        .foregroundColor(ScoreFormat.point100.scoreColor(score: Double(viewModel.details?.meanScore ?? 0)))
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
    }
}

struct MediaContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MediaContextMenuView(mediaId: 1)
    }
}
