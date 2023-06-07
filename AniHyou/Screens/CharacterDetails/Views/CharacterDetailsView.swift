//
//  CharacterDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/11/2022.
//

import SwiftUI
import RichText

struct CharacterDetailsView: View {
    
    var characterId: Int
    @StateObject private var viewModel = CharacterDetailsViewModel()
    @State private var infoType: CharacterInfoType = .overview
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Picker("", selection: $infoType) {
                    ForEach(CharacterInfoType.allCases, id: \.self) { type in
                        Label(type.localizedName, systemImage: type.systemImage)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                switch infoType {
                case .overview:
                    characterOverview
                case .media:
                    characterMedia
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if viewModel.character != nil {
                    Button(action: { viewModel.toggleFavorite() }) {
                        Image(systemName: viewModel.character!.isFavourite ? "heart.fill" : "heart")
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var characterOverview: some View {
        if viewModel.character != nil {
            VStack(alignment: .center) {
                CircleImageView(imageUrl: viewModel.character!.image?.large, size: 150)
                
                Text(viewModel.character!.name?.userPreferred ?? "")
                    .font(.title3.weight(.bold))
                    .multilineTextAlignment(.center)
                
                Text(viewModel.character!.name?.native ?? "")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                
                Text(viewModel.alternativeNamesFormatted ?? "")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                
                HStack {
                    VStack(alignment: .leading) {
                        HInfoView(name: "Birthday", value: viewModel.character!.dateOfBirth?.fragments.fuzzyDateFragment.formatted())
                        HInfoView(name: "Age", value: viewModel.character!.age)
                        HInfoView(name: "Gender", value: viewModel.character!.gender)
                        HInfoView(name: "Blood type", value: viewModel.character!.bloodType)
                        
                        RichText(html: viewModel.character!.description ?? "")
                            .defaultStyle()
                            .customCSS(spoilerCss)
                            .padding()
                    }
                }
            }//:VStack
        } else {
            ProgressView()
                .onAppear {
                    viewModel.getCharacterDetails(characterId: characterId)
                }
        }
    }
    
    @ViewBuilder
    var characterMedia: some View {
        LazyVStack(alignment: .leading) {
            ForEach(viewModel.characterMedia, id: \.?.id) {
                if let item = $0 {
                    NavigationLink(destination: MediaDetailsView(mediaId: item.node!.id)) {
                        HListItemWithSubtitleView(title: item.node?.title?.userPreferred, subtitle: item.characterRole?.value?.localizedName, imageUrl: item.node?.coverImage?.large)
                    }
                }
            }
            if viewModel.hasNextPageMedia {
                ProgressView()
                    .onAppear {
                        viewModel.getCharacterMedia(characterId: characterId)
                    }
            }
        }//:LazyVStack
        .padding(.horizontal)
    }
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(characterId: 21044)
    }
}
