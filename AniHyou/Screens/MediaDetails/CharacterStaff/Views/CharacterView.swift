//
//  CharacterView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI

private let imageSize: CGFloat = 70

struct CharacterView: View {
    
    var character: MediaCharacter
    
    var body: some View {
        HStack {
            NavigationLink(destination: CharacterDetailsView(characterId: character.node!.id)) {
                HStack {
                    CircleImageView(imageUrl: character.node?.image?.medium, size: imageSize)
                    VStack(alignment: .leading) {
                        Text(character.node?.name?.userPreferred ?? "")
                            .font(.system(size: 13))
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .foregroundColor(.primary)
                        Text(character.role?.value?.localizedName ?? "")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }//:HStack
            }
            
            Spacer()
            
            if character.voiceActors?.isEmpty == false {
                NavigationLink(destination: StaffDetailsView(staffId: character.voiceActors![0]!.id)) {
                    HStack {
                        VStack(alignment: .trailing) {
                            Text(character.voiceActors![0]!.name?.userPreferred ?? "")
                                .font(.footnote)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(3)
                                .foregroundColor(.primary)
                            Text("Japanese")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        CircleImageView(imageUrl: character.voiceActors![0]!.image?.medium, size: imageSize)
                    }//:HStack
                }
            }
        }
        .frame(height: imageSize)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: .init(_fieldData: nil))
            .padding()
    }
}
