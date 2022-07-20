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
            HStack {
                CircleImageView(imageUrl: character.node?.image?.medium, size: imageSize)
                VStack(alignment: .leading) {
                    Text(character.node?.name?.full ?? "")
                        .font(.system(size: 13))
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                    Text(character.role?.formatted ?? "")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            //.frame(width: .infinity)
            
            Spacer()
            
            if character.voiceActors?.isEmpty == false {
                HStack {
                    VStack(alignment: .trailing) {
                        Text(character.voiceActors?[0]?.name?.full ?? "")
                            .font(.footnote)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(3)
                        Text("Japanese")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    CircleImageView(imageUrl: character.voiceActors?[0]?.image?.medium, size: imageSize)
                }
                //.frame(width: .infinity)
            }
        }
        .frame(height: imageSize)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: MediaCharacter())
            .padding()
    }
}
