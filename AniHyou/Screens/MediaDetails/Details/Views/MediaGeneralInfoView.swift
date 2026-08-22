//
//  MediaGeneralInfoView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI
import Flow
import AniListAPI

// swiftlint:disable:next type_body_length
struct MediaGeneralInfoView: View {

    var viewModel: MediaDetailsViewModel
    @State private var showSpoilerTags = false
    @State private var showAllTags = false
    private let tagLimit = 10
    @State var showOpDialog = false
    @State var showEdDialog = false

    var body: some View {
        VStack(alignment: .leading) {
            generalInfo

            tags

            multimediaContent
            
            if let openings = viewModel.openings {
                themesList(
                    title: "Openings",
                    themes: openings,
                    showingDialog: $showOpDialog
                )
            } else if viewModel.isLoadingThemes {
                HorizontalProgressView()
                    .task {
                        if viewModel.isAnime, let idMal = viewModel.mediaDetails?.idMal {
                            await viewModel.getAnimeThemes(idMal: idMal)
                        } else {
                            viewModel.isLoadingThemes = false
                        }
                    }
            }
            if let endings = viewModel.endings {
                themesList(
                    title: "Endings",
                    themes: endings,
                    showingDialog: $showEdDialog
                )
            }
        }
    }
    
    @ViewBuilder
    var generalInfo: some View {
        Text("Information")
            .font(.title3)
            .bold()
            .padding(.horizontal)
        
        if let schedule = viewModel.mediaDetails?.nextAiringEpisode {
            let date = Date(timeIntervalSince1970: Double(schedule.airingAt))
            HInfoView(
                name: "Airing",
                value: date.formatted(date: .complete, time: .shortened)
            )
        }
        
        if viewModel.mediaDetails?.format?.value == .novel {
            HInfoView(name: "Chapters", value: viewModel.mediaDetails?.chapters?.formatted())
        } else if !viewModel.isAnime {
            HInfoView(name: "Volumes", value: viewModel.mediaDetails?.volumes?.formatted())
        }

        if let episodes = viewModel.mediaDetails?.episodes, episodes <= 1 {
            HInfoView(name: "Episodes", value: episodes.formatted())
        } else if let duration = viewModel.mediaDetails?.duration {
            let seconds = TimeInterval(duration * 60)
            HInfoView(name: "Duration", value: seconds.formatted(units: [.hour, .minute], unitsStyle: .abbreviated))
        }
        HInfoView(
            name: "Start date",
            value: viewModel.mediaDetails?.startDate?.fragments.fuzzyDateFragment.formatted()
        )
        HInfoView(
            name: "End date",
            value: viewModel.mediaDetails?.endDate?.fragments.fuzzyDateFragment.formatted()
        )
        
        if viewModel.isAnime {
            HInfoView(name: "Season", value: viewModel.seasonFormatted)
            HInfoView(name: "Studios", value: viewModel.studiosFormatted, isExpandable: true) {
                ForEach(viewModel.studios ?? [], id: \.id) { studio in
                    NavigationLink(studio.name) {
                        StudioDetailsView(studioId: studio.id)
                    }
                    .padding(.top, 1)
                }
            }
            HInfoView(name: "Producers", value: viewModel.producersFormatted, isExpandable: true) {
                ForEach(viewModel.producers ?? [], id: \.id) { producer in
                    NavigationLink(producer.name) {
                        StudioDetailsView(studioId: producer.id)
                    }
                    .padding(.top, 1)
                }
            }
        }
        HInfoView(
            name: "Source",
            valueLocalized: viewModel.mediaDetails?.source?.value?.localizedName
        )
        HInfoView(name: "Romaji", value: viewModel.mediaDetails?.title?.romaji, isExpandable: true)
        HInfoView(name: "English", value: viewModel.mediaDetails?.title?.english, isExpandable: true)
        HInfoView(name: "Native", value: viewModel.mediaDetails?.title?.native, isExpandable: true)
        if let synonyms = viewModel.synonymsFormatted, !synonyms.isEmpty {
            HInfoView(name: "Synonyms", value: viewModel.synonymsFormatted, isExpandable: true)
        }
    }

    @ViewBuilder
    var tags: some View {
        if let mediaTags = viewModel.mediaDetails?.tags?.compactMap({ $0 }) {
            HStack {
                Text("Tags")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                Spacer()
                if mediaTags.contains(where: { $0.isMediaSpoiler == true }) {
                    Button(
                        action: {
                            withAnimation {
                                showSpoilerTags.toggle()
                            }
                        },
                        label: {
                            Text(showSpoilerTags ? "Hide spoiler" : "Show spoiler")
                                .font(.footnote)
                        }
                    )
                    .padding(.horizontal)
                }
            }
            .padding(.top)

            let tagsFiltered = mediaTags
                .filter {
                    $0.isMediaSpoiler == false || $0.isMediaSpoiler == showSpoilerTags
                }
                .prefix(showAllTags ? mediaTags.count : tagLimit)
            
            HFlow {
                ForEach(tagsFiltered, id: \.id) { tag in
                    MediaTagItemView(tag: tag)
                }
            }
            .padding(.horizontal)
            
            HStack {
                Spacer()
                Button(
                    action: {
                        withAnimation {
                            showAllTags.toggle()
                        }
                    },
                    label: {
                        Text(showAllTags ? "Show less" : "Show more")
                            .font(.footnote)
                    }
                )
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }

    @ViewBuilder
    var multimediaContent: some View {
        // MARK: - Trailer
        if let trailer = viewModel.mediaDetails?.trailer,
            let trailerLink = viewModel.trailerLink {
            Text("Trailer")
                .font(.title3)
                .bold()
                .padding(.horizontal)

            Link(destination: URL(string: trailerLink)!) {
                VideoThumbnailView(imageUrl: trailer.thumbnail)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }

        // MARK: - Streaming episodes
        if let episodes = viewModel.mediaDetails?.streamingEpisodes {
            if !episodes.isEmpty {
                Text("Episodes")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(episodes, id: \.?.url) {
                            if let item = $0 {
                                VStack {
                                    Link(destination: URL(string: item.url!)!) {
                                        VideoThumbnailView(imageUrl: item.thumbnail)
                                    }
                                    .padding(.bottom, 2)
                                    Text(item.title ?? "")
                                }
                                .frame(width: videoWidth)
                                .padding(.leading)
                                .padding(.bottom)
                            }
                        }
                    }
                }
            }
        }

        // MARK: - Streaming links
        if !viewModel.streamingLinks.isEmpty {
            Text("Streaming sites")
                .font(.title3)
                .bold()
                .padding(.horizontal)
            HFlow {
                ForEach(viewModel.streamingLinks, id: \.?.id) {
                    if let item  = $0 {
                        Link(item.displayName, destination: URL(string: item.url!)!)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .tint(.primary)
                            .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }

        // MARK: - External links
        if !viewModel.externalLinks.isEmpty {
            Text("External links")
                .font(.title3)
                .bold()
                .padding(.horizontal)
            HFlow {
                ForEach(viewModel.externalLinks, id: \.?.id) {
                    if let item  = $0 {
                        Link(item.displayName, destination: URL(string: item.url!)!)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .tint(.primary)
                            .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
    
    @ViewBuilder
    func themesList(
        title: String,
        themes: [AnimeThemes.Theme],
        showingDialog: Binding<Bool>
    ) -> some View {
        Text(title)
            .font(.title3)
            .bold()
            .padding(.horizontal)
            .padding(.bottom, 4)
        ForEach(themes) { theme in
            Button(action: { showingDialog.wrappedValue = true }) {
                Text(theme.text)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal)
            .padding(.bottom, 4)
            .confirmationDialog("", isPresented: showingDialog) {
                ForEach(MusicStreaming.allCases, id: \.self) { service in
                    Link(service.name,
                         destination: URL(string: service.searchUrl + theme.queryText)!
                    )
                }
            }
        }
    }
}

#Preview {
    MediaGeneralInfoView(viewModel: MediaDetailsViewModel())
}
