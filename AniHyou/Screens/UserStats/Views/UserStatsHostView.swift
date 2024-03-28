//
//  UserStatsHostView.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/03/2023.
//

import SwiftUI
import AniListAPI

struct UserStatsHostView: View {

    let userId: Int
    @State private var mediaType: MediaType = .anime
    @State private var statType: UserStatType = .overview

    var body: some View {
        VStack(alignment: .leading) {
            Picker("Stats", selection: $statType) {
                ForEach(UserStatType.allCases, id: \.self) { type in
                    if mediaType == .manga && !type.isAnime {
                        Text(type.localizedName)
                    } else if mediaType == .anime {
                        Text(type.localizedName)
                    }
                }
            }
            .onChange(of: statType) { value in
                if mediaType == .manga && value.isAnime {
                    mediaType = .anime
                }
            }
            .padding(.horizontal, 4)
            
            Picker("", selection: $mediaType) {
                Text("Anime").tag(MediaType.anime)
                Text("Manga").tag(MediaType.manga)
            }
            .pickerStyle(.segmented)
            .disabled(statType.isAnime)
            .padding(.vertical)
            .padding(.horizontal)

            switch statType {
            case .overview:
                OverviewStatsView(userId: userId, mediaType: mediaType)
                    .id(mediaType)
            case .genres:
                GenresStatsView(userId: userId, mediaType: mediaType)
                    .id(mediaType)
            case .tags:
                TagsStatsView(userId: userId, mediaType: mediaType)
                    .id(mediaType)
            case .staff:
                StaffStatsView(userId: userId, mediaType: mediaType)
                    .id(mediaType)
            case .voiceActors:
                VoiceActorsStatsView(userId: userId)
            case .studios:
                StudiosStatsView(userId: userId)
            }
        }
    }
}

#Preview {
    UserStatsHostView(userId: 208863)
}
