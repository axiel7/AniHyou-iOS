//
//  MediaGeneralInfoView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI
import SwiftUIFlow

struct MediaGeneralInfoView: View {
    
    @ObservedObject var viewModel: MediaDetailsViewModel
    @State private var showSpoilerTags = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Information")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                Group {
                    HInfoView(name: "Genres", value: viewModel.genresFormatted, isExpandable: true)
                    if viewModel.isAnime {
                        HInfoView(name: "Episodes", value: viewModel.mediaDetails?.episodes?.formatted())
                    } else {
                        HInfoView(name: "Chapters", value: viewModel.mediaDetails?.chapters?.formatted())
                        HInfoView(name: "Volumes", value: viewModel.mediaDetails?.volumes?.formatted())
                    }
                    if let duration = viewModel.mediaDetails?.duration {
                        HInfoView(name: "Duration", value: duration.minutesToLegibleText())
                    }
                    HInfoView(name: "Start date", value: viewModel.mediaDetails?.startDate?.fragments.fuzzyDate.formatted())
                    HInfoView(name: "End date", value: viewModel.mediaDetails?.endDate?.fragments.fuzzyDate.formatted())
                }
                Group {
                    if viewModel.isAnime {
                        HInfoView(name: "Season", value: viewModel.seasonFormatted)
                        HInfoView(name: "Studios", value: viewModel.studiosFormatted, isExpandable: true)
                        HInfoView(name: "Producers", value: viewModel.producersFormatted, isExpandable: true)
                    }
                    HInfoView(name: "Source", value: viewModel.mediaDetails?.source?.value?.localizedName)
                    HInfoView(name: "Romaji", value: viewModel.mediaDetails?.title?.romaji, isExpandable: true)
                    HInfoView(name: "English", value: viewModel.mediaDetails?.title?.english, isExpandable: true)
                    HInfoView(name: "Native", value: viewModel.mediaDetails?.title?.native, isExpandable: true)
                    HInfoView(name: "Synonyms", value: viewModel.synonymsFormatted, isExpandable: true)
                }
            }
            
            Group {
                if let mediaTags = viewModel.mediaDetails?.tags {
                    HStack {
                        Text("Tags")
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                        Spacer()
                        Button(action: {
                            withAnimation {
                                showSpoilerTags.toggle()
                            }
                        }) {
                            Text(showSpoilerTags ? "Hide spoiler" : "Show spoiler")
                                .font(.footnote)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                    
                    VFlow(alignment: .leading) {
                        ForEach(mediaTags, id: \.?.id) {
                            if let tag = $0 {
                                MediaTagItemView(tag: tag, showSpoiler: $showSpoilerTags)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct MediaGeneralInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MediaGeneralInfoView(viewModel: MediaDetailsViewModel())
    }
}
