//
//  MediaGeneralInfoView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI

struct MediaGeneralInfoView: View {
    
    @ObservedObject var viewModel: MediaDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Information")
                .font(.title3)
                .bold()
                .padding(.leading)
            MediaInfoView(name: "Genres", value: viewModel.genresFormatted, isExpandable: true)
            if viewModel.isAnime {
                MediaInfoView(name: "Episodes", value: viewModel.mediaDetails?.episodes?.formatted())
            } else {
                MediaInfoView(name: "Chapters", value: viewModel.mediaDetails?.chapters?.formatted())
                MediaInfoView(name: "Volumes", value: viewModel.mediaDetails?.volumes?.formatted())
            }
            MediaInfoView(name: "Start date", value: viewModel.mediaDetails?.startDate?.fragments.fuzzyDate.formatted())
            MediaInfoView(name: "End date", value: viewModel.mediaDetails?.endDate?.fragments.fuzzyDate.formatted())
            
            if viewModel.isAnime {
                MediaInfoView(name: "Season", value: viewModel.seasonFormatted)
                MediaInfoView(name: "Studios", value: viewModel.studiosFormatted, isExpandable: true)
                MediaInfoView(name: "Producers", value: viewModel.producersFormatted, isExpandable: true)
            }
            MediaInfoView(name: "Source", value: viewModel.mediaDetails?.source?.value?.localizedName)
            MediaInfoView(name: "Romaji", value: viewModel.mediaDetails?.title?.romaji, isExpandable: true)
            MediaInfoView(name: "English", value: viewModel.mediaDetails?.title?.english, isExpandable: true)
            MediaInfoView(name: "Native", value: viewModel.mediaDetails?.title?.native, isExpandable: true)
        }
    }
}

struct MediaGeneralInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MediaGeneralInfoView(viewModel: MediaDetailsViewModel())
    }
}
