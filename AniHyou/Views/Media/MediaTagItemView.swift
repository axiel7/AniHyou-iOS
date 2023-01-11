//
//  MediaTagItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/01/2023.
//

import SwiftUI
import API

struct MediaTagItemView: View {
    
    var tag: MediaDetailsQuery.Data.Media.Tag?
    var showSpoiler: Binding<Bool>
    
    var body: some View {
        VStack {
            HStack {
                Text(tag?.name ?? "LMAO")
                    .background {
                        if tag?.isMediaSpoiler == true && !showSpoiler.wrappedValue {
                            RoundedRectangle(cornerRadius: 4)
                        }
                    }
                Spacer()
                Text("\(tag?.rank ?? 0)%")
            }
            Divider()
        }
        .padding(.horizontal)
        .padding(.top, 7)
    }
}

struct MediaTagItemView_Previews: PreviewProvider {
    static var previews: some View {
        MediaTagItemView(tag: nil, showSpoiler: .constant(false))
    }
}
