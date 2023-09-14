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
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15))
    ]

    var body: some View {

        // MARK: anime
        FavoriteSectionGrid(title: "Anime", columns: gridColumns) {
            ForEach(viewModel.favoritesAnime, id: \.?.id) {
                if let media = $0 {
                    NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                        VListItemView(title: media.title?.userPreferred ?? "", imageUrl: media.coverImage?.large)
                            .mediaContextMenu(
                                mediaId: media.id,
                                mediaType: .anime,
                                mediaListStatus: media.mediaListEntry?.status?.value
                            )
                    }
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

        Divider()

        // MARK: manga
        FavoriteSectionGrid(title: "Manga", columns: gridColumns) {
            ForEach(viewModel.favoritesManga, id: \.?.id) {
                if let media = $0 {
                    NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                        VListItemView(
                            title: media.title?.userPreferred ?? "",
                            imageUrl: media.coverImage?.large
                        )
                        .mediaContextMenu(
                            mediaId: media.id,
                            mediaType: .manga,
                            mediaListStatus: media.mediaListEntry?.status?.value
                        )
                    }
                }
            }

            if viewModel.hasNextPageAnime {
                ProgressView()
                    .onAppear {
                        viewModel.getFavoritesManga(userId: userId)
                    }
            } else if viewModel.favoritesManga.isEmpty {
                EmptyFavoritesText()
            }
        }

        Divider()

        // MARK: characters
        FavoriteSectionGrid(title: "Characters", columns: gridColumns) {
            ForEach(viewModel.favoritesCharacters, id: \.?.id) {
                if let character = $0 {
                    NavigationLink(destination: CharacterDetailsView(characterId: character.id)) {
                        VListItemView(title: character.name?.userPreferred ?? "", imageUrl: character.image?.large)
                    }
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

        Divider()

        // MARK: staff
        FavoriteSectionGrid(title: "Staff", columns: gridColumns) {
            ForEach(viewModel.favoritesStaff, id: \.?.id) {
                if let staff = $0 {
                    NavigationLink(destination: StaffDetailsView(staffId: staff.id)) {
                        VListItemView(title: staff.name?.userPreferred ?? "", imageUrl: staff.image?.large)
                    }
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

        Divider()

        // MARK: studios
        FavoriteSectionGrid(title: "Studios", columns: gridColumns) {
            ForEach(viewModel.favoritesStudio, id: \.?.id) {
                if let studio = $0 {
                    NavigationLink(destination: StudioDetailsView(studioId: studio.id)) {
                        Text(studio.name)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                            .padding()
                            .background(.regularMaterial)
                            .foregroundColor(.primary)
                            .cornerRadius(8)
                    }
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
        let title: String
        let columns: [GridItem]
        @ViewBuilder let content: Content

        var body: some View {
            Group {
                Text(title)
                    .font(.title3)
                    .bold()
                    .padding(.leading)

                LazyVGrid(columns: columns) {
                    content
                }
                .frame(minHeight: 200)
            }
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
