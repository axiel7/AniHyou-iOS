//
//  CharacterView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI
import AniListAPI

private let imageSize: CGFloat = 70

struct CharacterView: View {

    let character: MediaCharacter?

    var body: some View {
        HStack {
            NavigationLink(destination: CharacterDetailsView(characterId: character!.node!.id)) {
                HStack {
                    CircleImageView(imageUrl: character?.node?.image?.medium, size: imageSize)
                    VStack(alignment: .leading) {
                        Text(character?.node?.name?.userPreferred ?? "")
                            .font(.system(size: 13))
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .foregroundStyle(.primary)
                        Text(character?.role?.value?.localizedName ?? "")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                }//:HStack
            }
            .buttonStyle(.plain)

            Spacer()

            if character?.voiceActors?.isEmpty == false {
                NavigationLink(destination: StaffDetailsView(staffId: character!.voiceActors![0]!.id)) {
                    HStack {
                        VStack(alignment: .trailing) {
                            Text(character?.voiceActors![0]!.name?.userPreferred ?? "")
                                .font(.footnote)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(3)
                                .foregroundStyle(.primary)
                            Text("Japanese")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                        CircleImageView(imageUrl: character?.voiceActors![0]!.image?.medium, size: imageSize)
                    }//:HStack
                }
                .buttonStyle(.plain)
            }
        }
        .frame(height: imageSize)
    }
}

#Preview {
    CharacterView(character: nil)
        .padding()
}
