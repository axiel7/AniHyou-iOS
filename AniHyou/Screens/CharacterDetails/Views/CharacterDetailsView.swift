//
//  CharacterDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/11/2022.
//

import SwiftUI
import RichText

struct CharacterDetailsView: View {

    let characterId: Int
    @StateObject private var viewModel = CharacterDetailsViewModel()
    @State private var infoType: CharacterInfoType = .overview
    @State private var showNameSpoiler = false
    @State private var showImageSheet = false

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
                if let character = viewModel.character {
                    Button(action: {
                        Task {
                            await viewModel.toggleFavorite()
                        }
                    }) {
                        Image(systemName: character.isFavourite ? "heart.fill" : "heart")
                    }
                    .tint(nil)
                }
            }
        }
    }

    @ViewBuilder
    var characterOverview: some View {
        if let character = viewModel.character {
            VStack(alignment: .center) {
                Button(action: { showImageSheet.toggle() }) {
                    CircleImageView(imageUrl: character.image?.large, size: 150)
                }

                Text(character.name?.userPreferred ?? "")
                    .font(.title3.weight(.bold))
                    .multilineTextAlignment(.center)

                Group {
                    Text(character.name?.native ?? "")
                    
                    Text(viewModel.alternativeNamesFormatted ?? "")
                    
                    if viewModel.alternativeNamesSpoilerFormatted?.isEmpty == false {
                        Group {
                            if showNameSpoiler {
                                Text(viewModel.alternativeNamesSpoilerFormatted!)
                            } else {
                                Text(viewModel.alternativeNamesSpoilerFormatted!)
                                    .redacted(reason: .placeholder)
                            }
                        }
                        .onTapGesture {
                            showNameSpoiler.toggle()
                        }
                    }
                }
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)

                HStack {
                    VStack(alignment: .leading) {
                        HInfoView(name: "Favorites", value: (character.favourites ?? 0).formatted())
                        HInfoView(
                            name: "Birthday",
                            value: character.dateOfBirth?.fragments.fuzzyDateFragment.formatted()
                        )
                        HInfoView(name: "Age", value: character.age)
                        if let genderLocalized = character.genderLocalized {
                            HInfoView(name: "Gender", valueLocalized: genderLocalized)
                        } else {
                            HInfoView(name: "Gender", value: character.gender)
                        }
                        HInfoView(name: "Blood type", value: character.bloodType)

                        RichText(html: character.description ?? "")
                            .defaultStyle()
                            .padding()
                    }
                }
            }//:VStack
            .sheet(isPresented: $showImageSheet) {
                FullCoverView(imageUrl: character.image?.large)
            }
        } else {
            HorizontalProgressView()
                .task {
                    await viewModel.getCharacterDetails(characterId: characterId)
                }
        }
    }

    @ViewBuilder
    var characterMedia: some View {
        LazyVStack(alignment: .leading) {
            ForEach(viewModel.characterMedia, id: \.id) { item in
                NavigationLink(destination: MediaDetailsView(mediaId: item.node!.id)) {
                    HListItemWithSubtitleView(
                        title: item.node?.title?.userPreferred,
                        subtitleLocalized: item.characterRole?.value?.localizedName,
                        subtitle2: item.node?.startDate?.year?.stringValue,
                        imageUrl: item.node?.coverImage?.large,
                        status: item.node?.mediaListEntry?.status?.value
                    )
                    .mediaContextMenu(
                        mediaId: item.node!.id,
                        mediaType: item.node!.type?.value,
                        mediaListStatus: item.node?.mediaListEntry?.status?.value
                    )
                }
                .buttonStyle(.plain)
                .padding(.bottom)
            }
            if viewModel.hasNextPageMedia {
                HorizontalProgressView()
                    .task {
                        await viewModel.getCharacterMedia(characterId: characterId)
                    }
            }
        }//:LazyVStack
        .padding(.horizontal)
    }
}

#Preview {
    CharacterDetailsView(characterId: 21044)
}
