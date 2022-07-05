//
//  MediaCharactersAndStaffView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI

struct MediaCharactersAndStaffView: View {
    
    @ObservedObject var viewModel: MediaDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Staff")
                .font(.title3)
                .bold()
                .padding(.leading)
            ZStack {
                if viewModel.mediaCharactersAndStaff == nil {
                    ProgressView()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(viewModel.mediaCharactersAndStaff?.staff?.edges ?? [], id: \.?.node?.id) {
                            if let staff = $0 {
                                StaffView(staff: staff.fragments.mediaStaff)
                                    .padding(.trailing)
                            }
                        }
                    }
                    .padding(.leading)
                }
            }
            .frame(height: StaffView.imageSize)
            .padding(.bottom)
            
            Text("Characters")
                .font(.title3)
                .bold()
                .padding(.leading)
            ZStack(alignment: .center) {
                if viewModel.mediaCharactersAndStaff == nil {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    .padding(.top)
                }
                LazyVStack {
                    ForEach(viewModel.mediaCharactersAndStaff?.characters?.edges ?? [], id: \.?.node?.id) {
                        if let character = $0 {
                            CharacterView(character: character.fragments.mediaCharacter)
                                .padding(.bottom)
                        }
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct MediaCharactersAndStaffView_Previews: PreviewProvider {
    static var previews: some View {
        MediaCharactersAndStaffView(viewModel: MediaDetailsViewModel())
    }
}
