//
//  UserFavoritesView.swift
//  AniHyou
//
//  Created by Axel Lopez on 17/08/2022.
//

import SwiftUI

struct UserFavoritesView: View {
    
    var userId: Int
    @StateObject private var viewModel = UserFavoritesViewModel()
    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 20))
    ]
    
    var body: some View {
        
        //MARK: anime
        FavoriteSectionGrid(title: "Anime", columns: gridColumns) {
            ForEach(viewModel.favoritesAnime, id: \.?.id) {
                if let media = $0 {
                    NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                        VListItemView(title: media.title?.userPreferred ?? "", imageUrl: media.coverImage?.large)
                    }
                }
            }
            
            if viewModel.hasNextPageAnime {
                ProgressView()
                    .onAppear {
                        viewModel.getFavoritesAnime(userId: userId)
                    }
            }
            else if viewModel.favoritesAnime.isEmpty {
                Text("No favorites")
            }
        }
        
        Divider()
        
        //MARK: manga
        FavoriteSectionGrid(title: "Manga", columns: gridColumns) {
            ForEach(viewModel.favoritesManga, id: \.?.id) {
                if let media = $0 {
                    NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                        VListItemView(title: media.title?.userPreferred ?? "", imageUrl: media.coverImage?.large)
                    }
                }
            }
            
            if viewModel.hasNextPageAnime {
                ProgressView()
                    .onAppear {
                        viewModel.getFavoritesManga(userId: userId)
                    }
            }
        }
        
        Divider()
        
        //MARK: characters
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
            }
        }
        
        Divider()
        
        //MARK: staff
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
            }
        }
        
        Divider()
        
        //MARK: studios
        FavoriteSectionGrid(title: "Studios", columns: [GridItem(.adaptive(minimum: 80), alignment: .leading)]) {
            ForEach(viewModel.favoritesStudio, id: \.?.id) {
                if let studio = $0 {
                    Text(studio.name)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .padding()
                        .background(.regularMaterial)
                        .cornerRadius(8)
                }
            }
            
            if viewModel.hasNextPageStudio {
                ProgressView()
                    .onAppear {
                        viewModel.getFavoritesStudio(userId: userId)
                    }
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
}

struct UserFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.vertical) {
            LazyVStack {
                UserFavoritesView(userId: 208863)
            }
        }
    }
}
