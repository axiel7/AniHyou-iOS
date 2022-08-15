//
//  MediaCharactersAndStaffView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI

struct MediaCharactersAndStaffView: View {
    
    @ObservedObject var viewModel: MediaDetailsViewModel
    private let gridRows = [
        GridItem(.fixed(StaffView.imageSize), alignment: .leading),
        GridItem(.fixed(StaffView.imageSize), alignment: .leading)
    ]
    
    var body: some View {
        if viewModel.mediaCharactersAndStaff != nil {
            VStack(alignment: .leading) {
                
                Text("Staff")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: gridRows, spacing: 16) {
                        ForEach(viewModel.mediaCharactersAndStaff?.staff?.edges ?? [], id: \.?.node?.id) {
                            if let staff = $0 {
                                StaffView(staff: staff.fragments.mediaStaff)
                            }
                        }
                    }//:HGrid
                    .frame(height: StaffView.imageSize * 2 + 20)
                    .padding(.leading)
                }//:HScrollView
                .padding(.bottom)
                
                Text("Characters")
                    .font(.title3)
                    .bold()
                    .padding(.leading)
                
                LazyVStack {
                    ForEach(viewModel.mediaCharactersAndStaff?.characters?.edges ?? [], id: \.?.node?.id) {
                        if let character = $0 {
                            CharacterView(character: character.fragments.mediaCharacter)
                                .padding(.bottom)
                        }
                    }
                }//:VStack
                .padding(.horizontal)
            }//:VStack
        } else {
            HStack {
                Spacer()
                ProgressView()
                    .padding()
                Spacer()
            }
        }
    }
}

struct MediaCharactersAndStaffView_Previews: PreviewProvider {
    static var previews: some View {
        MediaCharactersAndStaffView(viewModel: MediaDetailsViewModel())
    }
}
