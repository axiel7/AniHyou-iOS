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
        LazyVStack(alignment: .leading) {
            
            Text("Staff")
                .font(.title3)
                .bold()
                .padding(.leading)
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
            .padding(.bottom)
            
            Text("Characters")
                .font(.title3)
                .bold()
                .padding(.leading)
            ForEach(viewModel.mediaCharactersAndStaff?.characters?.edges ?? [], id: \.?.node?.id) {
                if let character = $0 {
                    CharacterView(character: character.fragments.mediaCharacter)
                        .padding(.bottom)
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
