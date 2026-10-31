//
//  MediaItemHorizontal.swift
//  AniHyou
//
//  Created by Axel on 02/08/2026.
//

import SwiftUI
import AniListAPI

private let coverWidth: CGFloat = 73
private let coverHeight: CGFloat = 110

struct MediaItemHorizontal: View {
    
    let coverImage: String?
    let listStatus: MediaListStatus?
    let position: Int?
    let title: String
    let mediaFormat: MediaFormat?
    let year: Int?
    let mediaStatus: MediaStatus?
    let score: Int?
    let episodes: Int?
    let chapters: Int?
    let duration: Int?
    let genres: [String?]?
    let blurCover: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack(alignment: .bottomTrailing) {
                MediaCoverView(
                    imageUrl: coverImage,
                    width: coverWidth,
                    height: coverHeight,
                    blurEnabled: blurCover
                )
                if let status = listStatus {
                    Image(systemName: status.systemImage)
                        .padding(4)
                        .background(.thinMaterial, in: .circle)
                        .padding(4)
                }
            }

            if let position {
                Text(position.stringValue)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.secondary)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
            } else {
                Spacer()
                    .frame(width: 12)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.body)
                    .foregroundStyle(.primary)
                    .padding(.bottom, 2)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                subtitle1
                
                subtitle2
                
                subtitle3
                    .padding(.top, 4)
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
    
    @ViewBuilder
    var subtitle1: some View {
        Group {
            let yearSeparator = if year != nil { " · " } else { "" }
            let statusSeparator = if mediaStatus != nil { " · " } else { "" }
            
            Text(mediaFormat?.localizedName ?? "Unknown") +
            Text(yearSeparator) +
            Text(year?.stringValue ?? "") +
            Text(statusSeparator) +
            Text(mediaStatus?.localizedName ?? "")
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)
        .lineLimit(1)
        .multilineTextAlignment(.leading)
    }
    
    @ViewBuilder
    var subtitle2: some View {
        let score = score ?? 0
        let scoreColor = ScoreFormat.point100.color(score: score)
        
        HStack {
            HStack(alignment: .bottom, spacing: 4) {
                Image(systemName: "star.fill")
                Text("\(score)%")
            }
            .foregroundStyle(scoreColor)
            
            let episodes = episodes ?? 0
            
            if let chapters = chapters {
                Text("^[\(chapters) chapter](inflect: true)")
            } else if episodes <= 1 {
                if let duration = duration {
                    let seconds = TimeInterval(duration * 60)
                    Text(seconds.formatted(units: [.hour, .minute], unitsStyle: .abbreviated) ?? "")
                }
            } else if episodes > 0 {
                Text("^[\(episodes) episode](inflect: true)")
            }
        }
        .font(.footnote)
        .foregroundStyle(.secondary)
    }
    
    @ViewBuilder
    var subtitle3: some View {
        if let genres = genres?.compactMap({ $0?.genreLocalized }) {
            genres.joined(separator: ", ")
                .maxLines(1)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    MediaItemHorizontal(
        coverImage: "",
        listStatus: .completed,
        position: nil,
        title: "This is a very very large title to test the UI layout when titles are too large",
        mediaFormat: .movie,
        year: 2026,
        mediaStatus: .notYetReleased,
        score: 89,
        episodes: 1,
        chapters: 1,
        duration: 100,
        genres: ["Action", "Drama", "Fantasy"],
        blurCover: false
    )
}
