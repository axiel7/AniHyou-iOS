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
    @State private var viewModel = StaffDetailsViewModel()
    @State private var infoType: StaffInfoType = .overview
    @State private var showImageSheet = false
    @AppStorage(BLUR_ADULT_MEDIA) private var blurAdultMedia = true

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
            ToolbarItem(placement: .topBarTrailing) {
                if let staff = viewModel.staff {
                    Button {
                        Task { await viewModel.toggleFavorite() }
                    } label: {
                        Image(systemName: staff.isFavourite ? "heart.fill" : "heart")
                    }
                    .tint(nil)
                }
            }
            if infoType == .media || infoType == .characters {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Menu("On my list") {
                            TriPicker("On my list", selection: $viewModel.onMyList)
                                .onChange(of: viewModel.onMyList) {
                                    viewModel.resetStaffMedia()
                                    viewModel.resetStaffCharacters()
                                }
                        }
                        if infoType == .media {
                            Menu("Media Type") {
                                Picker("Media Type", selection: $viewModel.mediaType) {
                                    Text("None").tag(nil as MediaType?)
                                    ForEach(MediaType.allCases, id: \.self) {
                                        Text($0.localizedName).tag($0)
                                    }
                                }
                                .onChange(of: viewModel.mediaType) {
                                    viewModel.resetStaffMedia()
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                    .tint(nil)
                }
            }
        }
    }

    @ViewBuilder
    var staffOverview: some View {
        if let staff = viewModel.staff {
            VStack(alignment: .center) {
                Button(action: { showImageSheet.toggle() }) {
                    CircleImageView(imageUrl: staff.image?.large, size: 150)
                }

                Text(staff.name?.userPreferred ?? "")
                    .font(.title3.weight(.bold))
                    .multilineTextAlignment(.center)

                Text(staff.name?.native ?? "")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)

                HStack {
                    VStack(alignment: .leading) {
                        HInfoView(name: "Favorites", value: (staff.favourites ?? 0).formatted())
                        HInfoView(
                            name: "Birth",
                            value: staff.dateOfBirth?.fragments.fuzzyDateFragment.formatted()
                        )
                        if let dateOfDeath = staff.dateOfDeath {
                            HInfoView(
                                name: "Death",
                                value: dateOfDeath.fragments.fuzzyDateFragment.formatted()
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
            .sheet(isPresented: $showImageSheet) {
                FullCoverView(imageUrl: staff.image?.large)
            }
        } else {
            HorizontalProgressView()
                .task {
                    await viewModel.getStaffDetails(staffId: staffId)
                }
        }
    }

    private let gridColumns = [
        GridItem(.adaptive(minimum: VListItemView.coverWidth + 15), alignment: .top)
    ]

    @ViewBuilder
    var staffMedia: some View {
        LazyVStack(alignment: .leading) {
            ForEach(viewModel.staffMedia, id: \.value.id) { item in
                if let media = item.value.node {
                    NavigationLink(destination: MediaDetailsView(mediaId: media.id)) {
                        HListItemWithSubtitleView(
                            title: media.title?.userPreferred,
                            subtitle: item.staffRoles.joined(separator: ", "),
                            subtitle2: media.startDate?.year?.stringValue,
                            imageUrl: media.coverImage?.large,
                            status: media.mediaListEntry?.status?.value,
                            blurCover: blurAdultMedia && media.isAdult == true
                        )
                        .mediaContextMenu(
                            mediaId: media.id,
                            mediaType: media.type?.value,
                            mediaListStatus: media.mediaListEntry?.status?.value
                        )
                    }
                    .buttonStyle(.plain)
                    .padding(.bottom)
                }
            }
            if viewModel.hasNextPageMedia {
                HorizontalProgressView()
                    .task {
                        await viewModel.getStaffMedia(staffId: staffId)
                    }
            }
        }//:LazyVStack
        .padding(.horizontal)
    }

    @ViewBuilder
    var staffCharacters: some View {
        LazyVStack(alignment: .leading) {
            ForEach(viewModel.staffCharacters, id: \.id) {
                if let characters = $0.characters,
                    let node = $0.node {
                    ForEach(characters, id: \.?.id) {
                        if let character = $0 {
                            NavigationLink(destination: CharacterDetailsView(characterId: character.id)) {
                                HListItemWithSubtitleView(
                                    title: character.name?.userPreferred,
                                    subtitle: node.title?.userPreferred,
                                    imageUrl: character.image?.large
                                )
                            }
                            .buttonStyle(.plain)
                            .padding(.bottom)
                        }
                    }
                }
            }
            if viewModel.hasNextPageCharacters {
                HorizontalProgressView()
                    .task {
                        await viewModel.getStaffCharacters(staffId: staffId)
                    }
            }
        }//:LazyVStack
        .padding(.horizontal)
    }
}

#Preview {
    StaffDetailsView(staffId: 97836)
}
