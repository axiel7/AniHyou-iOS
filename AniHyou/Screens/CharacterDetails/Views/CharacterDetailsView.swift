//
//  CharacterDetailsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 08/11/2022.
//

import SwiftUI
import RichText

struct CharacterDetailsView: View {
    
    var characterId: Int
    @StateObject private var viewModel = CharacterDetailsViewModel()
    
    var body: some View {
        if viewModel.character != nil {
            ScrollView(.vertical) {
                VStack(alignment: .center) {
                    CircleImageView(imageUrl: viewModel.character!.image?.large, size: 150)
                    
                    Text(viewModel.character!.name?.userPreferred ?? "")
                        .font(.title3.weight(.bold))
                        .multilineTextAlignment(.center)
                    
                    Text(viewModel.character!.name?.native ?? "")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                    Text(viewModel.alternativeNamesFormatted ?? "")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HInfoView(name: "Birthday", value: viewModel.character!.dateOfBirth?.fragments.fuzzyDate.formatted())
                            HInfoView(name: "Age", value: viewModel.character!.age)
                            HInfoView(name: "Gender", value: viewModel.character!.gender)
                            HInfoView(name: "Blood type", value: viewModel.character!.bloodType)
                            
                            RichText(html: viewModel.character!.description ?? "")
                                .defaultStyle()
                                .customCSS(spoilerCss)
                                .padding()
                        }
                    }
                }
            }//:VScrollView
        } else {
            ProgressView()
                .onAppear {
                    viewModel.getCharacterDetails(characterId: characterId)
                }
        }
    }
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(characterId: 21044)
    }
}
