//
//  MediaCharactersAndStaffView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI

struct MediaCharactersAndStaffView: View {

    let mediaId: Int
    @StateObject private var viewModel = CharacterStaffViewModel()
    private let gridRows = [
        GridItem(.fixed(StaffView.imageSize), spacing: 16, alignment: .leading),
        GridItem(.fixed(StaffView.imageSize), alignment: .leading)
    ]

    var body: some View {
        if viewModel.mediaCharactersAndStaff != nil {
            VStack(alignment: .leading) {

                Text("Staff")
                    .font(.title3)
                    .bold()
                    .padding(.leading)

                staffHScrollView

                Text("Characters")
                    .font(.title3)
                    .bold()
                    .padding(.leading)

                charactersVScrollView

            }//:VStack
        } else {
            HorizontalProgressView()
                .padding()
                .task {
                    await viewModel.getMediaCharactersAndStaff(mediaId: mediaId)
                }
        }
    }

    var staffHScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridRows, spacing: 16) {
                ForEach(viewModel.mediaCharactersAndStaff?.staff?.edges ?? [], id: \.?.id) {
                    if let staff = $0 {
                        StaffView(staff: staff.fragments.mediaStaff)
                    }
                }
            }//:HGrid
            .scrollTargetLayout()
            .frame(height: StaffView.imageSize * 2 + 20)
            .padding(.leading)
        }//:HScrollView
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
        .padding(.bottom)
    }

    var charactersVScrollView: some View {
        LazyVStack {
            ForEach(viewModel.mediaCharactersAndStaff?.characters?.edges ?? [], id: \.?.node?.id) {
                if let character = $0 {
                    CharacterView(character: character.fragments.mediaCharacter)
                        .padding(.bottom)
                }
            }
        }//:VStack
        .padding(.horizontal)
    }
}

#Preview {
    MediaCharactersAndStaffView(mediaId: 1)
}
