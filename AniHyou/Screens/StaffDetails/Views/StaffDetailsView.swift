//
//  StaffDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 09/11/2022.
//

import SwiftUI
import RichText
import AniListAPI

struct StaffDetailsView: View {

    let staffId: Int
    @StateObject private var viewModel = StaffDetailsViewModel()
    @State private var infoType: StaffInfoType = .overview

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Picker("", selection: $infoType) {
                    ForEach(StaffInfoType.allCases, id: \.self) { type in
                        Label(type.localizedName, systemImage: type.systemImage)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                switch infoType {
                case .overview:
                    staffOverview
                case .media:
                    staffMedia
                case .characters:
                    staffCharacters
                }
            }//:VStack
        }//:VScrollView
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if let staff = viewModel.staff {
                    Button(action: { viewModel.toggleFavorite() }) {
                        Image(systemName: staff.isFavourite ? "heart.fill" : "heart")
                    }
                }
            }
        }
    }

    @ViewBuilder
    var staffOverview: some View {
        if let staff = viewModel.staff {
            VStack(alignment: .center) {
                CircleImageView(imageUrl: staff.image?.large, size: 150)

                Text(staff.name?.userPreferred ?? "")
                    .font(.title3.weight(.bold))
                    .multilineTextAlignment(.center)

                Text(staff.name?.native ?? "")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)

                HStack {
                    VStack(alignment: .leading) {
                        HInfoView(name: "Favorites", value: (staff.favourites ?? 0).formatted())
                        HInfoView(
                            name: "Birth",
                            value: staff.dateOfBirth?.fragments.fuzzyDateFragment.formatted()
                        )
                        if staff.dateOfDeath?.year != nil {
                            HInfoView(
                                name: "Death",
                                value: viewModel.staff!.dateOfDeath?.fragments.fuzzyDateFragment.formatted()
                            )
                        }
                        HInfoView(name: "Age", value: staff.age?.stringValue)
                        HInfoView(name: "Gender", value: staff.gender)
                        HInfoView(name: "Blood Type", value: staff.bloodType)
                        HInfoView(name: "Years active", value: viewModel.yearsActiveFormatted)
                        HInfoView(name: "Hometown", value: staff.homeTown, isExpandable: true)
                        HInfoView(name: "Occupations", value: viewModel.occupationsFormatted)

                        RichText(html: staff.description ?? "")
                            .defaultStyle()
                            .padding()
                    }
                }
            }//:VStack
        } else {
            ProgressView()
                .onAppear {
                    viewModel.getStaffDetails(staffId: staffId)
                }
        }
    }

    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15), alignment: .top)
    ]

    @ViewBuilder
    var staffMedia: some View {
        LazyVStack(alignment: .leading) {
            Toggle("On my list", isOn: $viewModel.mediaOnMyList)
            ForEach(viewModel.staffMedia, id: \.value.id) { item in
                if let media = item.value.node {
                    NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                        HListItemWithSubtitleView(
                            title: media.title?.userPreferred,
                            subtitle: item.staffRoles.joined(separator: ", "),
                            imageUrl: media.coverImage?.large
                        )
                        .mediaContextMenu(
                            mediaId: media.id,
                            mediaType: media.type?.value,
                            mediaListStatus: media.mediaListEntry?.status?.value
                        )
                    }
                }
            }
            if viewModel.hasNextPageMedia {
                HorizontalProgressView()
                    .onAppear {
                        viewModel.getStaffMedia(staffId: staffId)
                    }
            }
        }//:LazyVStack
        .padding(.horizontal)
        .onChange(of: viewModel.mediaOnMyList) { _ in
            viewModel.resetStaffMedia()
        }
    }

    @ViewBuilder
    var staffCharacters: some View {
        LazyVStack(alignment: .leading) {
            ForEach(viewModel.staffCharacters, id: \.?.id) {
                if let characters = $0?.characters {
                    ForEach(characters, id: \.?.id) {
                        if let character = $0 {
                            NavigationLink(destination: CharacterDetailsView(characterId: character.id)) {
                                HListItemWithSubtitleView(
                                    title: character.name?.userPreferred,
                                    imageUrl: character.image?.large
                                )
                            }
                        }
                    }
                }
            }
            if viewModel.hasNextPageCharacters {
                HorizontalProgressView()
                    .onAppear {
                        viewModel.getStaffCharacters(staffId: staffId)
                    }
            }
        }//:LazyVStack
        .padding(.horizontal)
    }
}

#Preview {
    StaffDetailsView(staffId: 97836)
}
