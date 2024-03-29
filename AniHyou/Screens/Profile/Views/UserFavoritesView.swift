//
//  UserFavoritesView.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import SwiftUI

struct UserFavoritesView: View {

    let userId: Int
    @StateObject private var viewModel = UserFavoritesViewModel()
    @State private var favoriteType: FavoriteType = .anime
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15))
    ]

    var body: some View {
        Picker("Favorites", selection: $favoriteType) {
            ForEach(FavoriteType.allCases, id: \.self) {
                Text($0.localizedName)
            }
        }
        
        switch favoriteType {
        case .anime:
            favoriteAnime
        case .manga:
            favoriteManga
        case .characters:
            favoriteCharacters
        case .staff:
            favoriteStaff
        case .studios:
            favoriteStudios
        }
    }
    
    var favoriteAnime: some View {
        FavoriteSectionGrid(columns: gridColumns) {
            ForEach(viewModel.favoritesAnime, id: \.?.id) {
                if let media = $0 {
                    NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                        VListItemView(
                            title: media.title?.userPreferred ?? "",
                            imageUrl: media.coverImage?.large,
                            status: media.mediaListEntry?.status?.value
                        )
                        .mediaContextMenu(
                            mediaId: media.id,
                            mediaType: .anime,
                            mediaListStatus: media.mediaListEntry?.status?.value
                        )
                    }
                    .buttonStyle(.plain)
                }
            }

            if viewModel.hasNextPageAnime {
                ProgressView()
                    .onAppear {
                        viewModel.getFavoritesAnime(userId: userId)
                    }
            } else if viewModel.favoritesAnime.isEmpty {
                EmptyFavoritesText()
            }
        }
    }
    
    var favoriteManga: some View {
        FavoriteSectionGrid(columns: gridColumns) {
            ForEach(viewModel.favoritesManga, id: \.?.id) {
                if let media = $0 {
                    NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                        VListItemView(
                            title: media.title?.userPreferred ?? "",
                            imageUrl: media.coverImage?.large,
                            status: media.mediaListEntry?.status?.value
                        )
                        .mediaContextMenu(
                            mediaId: media.id,
                            mediaType: .manga,
                            mediaListStatus: media.mediaListEntry?.status?.value
                        )
                    }
                    .buttonStyle(.plain)
                }
            }

            if viewModel.hasNextPageManga {
                ProgressView()
                    .onAppear {
                        viewModel.getFavoritesManga(userId: userId)
                    }
            } else if viewModel.favoritesManga.isEmpty {
                EmptyFavoritesText()
            }
        }
    }
    
    var favoriteCharacters: some View {
        FavoriteSectionGrid(columns: gridColumns) {
            ForEach(viewModel.favoritesCharacters, id: \.?.id) {
                if let character = $0 {
                    NavigationLink(destination: CharacterDetailsView(characterId: character.id)) {
                        VListItemView(title: character.name?.userPreferred ?? "", imageUrl: character.image?.large)
                    }
                    .buttonStyle(.plain)
                }
            }

            if viewModel.hasNextPageCharacter {
                ProgressView()
                    .onAppear {
                        viewModel.getFavoritesCharacter(userId: userId)
                    }
            } else if viewModel.favoritesCharacters.isEmpty {
                EmptyFavoritesText()
            }
        }
    }
    
    var favoriteStaff: some View {
        FavoriteSectionGrid(columns: gridColumns) {
            ForEach(viewModel.favoritesStaff, id: \.?.id) {
                if let staff = $0 {
                    NavigationLink(destination: StaffDetailsView(staffId: staff.id)) {
                        VListItemView(title: staff.name?.userPreferred ?? "", imageUrl: staff.image?.large)
                    }
                    .buttonStyle(.plain)
                }
            }

            if viewModel.hasNextPageStaff {
                ProgressView()
                    .onAppear {
                        viewModel.getFavoritesStaff(userId: userId)
                    }
            } else if viewModel.favoritesStaff.isEmpty {
                EmptyFavoritesText()
            }
        }
    }
    
    var favoriteStudios: some View {
        FavoriteSectionGrid(columns: gridColumns) {
            ForEach(viewModel.favoritesStudio, id: \.?.id) {
                if let studio = $0 {
                    NavigationLink(destination: StudioDetailsView(studioId: studio.id)) {
                        Text(studio.name)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                            .frame(minWidth: VListItemView.coverWidth - 15)
                            .padding()
                            .foregroundStyle(.primary)
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.regularMaterial)
                            }
                    }
                    .buttonStyle(.plain)
                }
            }

            if viewModel.hasNextPageStudio {
                ProgressView()
                    .onAppear {
                        viewModel.getFavoritesStudio(userId: userId)
                    }
            }

            if viewModel.favoritesStudio.isEmpty {
                EmptyFavoritesText()
            }
        }
    }

    private struct FavoriteSectionGrid<Content: View>: View {
        let columns: [GridItem]
        @ViewBuilder let content: () -> Content

        var body: some View {
            LazyVGrid(columns: columns, content: content)
                .frame(minHeight: 200)
        }
    }

    private struct EmptyFavoritesText: View {
        var text = "No favorites"

        var body: some View {
            HStack {
                Spacer()
                Text(text)
                Spacer()
            }
        }
    }
}

#Preview {
    ScrollView(.vertical) {
        LazyVStack {
            UserFavoritesView(userId: 208863)
        }
    }
}
