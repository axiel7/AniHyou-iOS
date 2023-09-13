//
//  UserStatsHostView.swift
//  AniHyou
//
//  Created by Axel Lopez on 02/03/2023.
//

import SwiftUI
import AniListAPI

struct UserStatsHostView: View {

    var userId: Int
    @State private var mediaType: MediaType = .anime
    @State private var statType: UserStatType = .overview

    var body: some View {
        VStack(alignment: .leading) {
            Picker("", selection: $mediaType) {
                Text("Anime").tag(MediaType.anime)
                Text("Manga").tag(MediaType.manga)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            Picker("Stats", selection: $statType) {
                ForEach(UserStatType.allCases, id: \.self) { type in
                    if type == .voiceActors || type == .studios {
                        if mediaType == .anime {
                            Text(type.localizedName)
                        }
                    } else {
                        Text(type.localizedName)
                    }
                }
            }
            .padding()

            switch statType {
            case .overview:
                OverviewStatsView(userId: userId, mediaType: mediaType)
                    .id(mediaType)
            case .genres:
                Text("Coming soon")
            case .tags:
                Text("Coming soon")
            case .staff:
                Text("Coming soon")
            case .voiceActors:
                Text("Coming soon")
            case .studios:
                Text("Coming soon")
            }
        }
    }
}

#Preview {
    UserStatsHostView(userId: 208863)
}
