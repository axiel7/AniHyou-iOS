//
//  AiringText.swift
//  AniHyou
//
//  Created by Axel Lopez on 07/02/2024.
//

import SwiftUI

struct AiringText: View {
    
    let episode: Int
    let airingAt: Int
    var episodesBehind: Int = 0
    var accentColor: Color = .accentColor
    
    var body: some View {
        if episodesBehind > 0 {
            Text("^[\(episodesBehind) episode behind](inflect: true)")
                .foregroundStyle(.gray)
        } else {
            let relativeDate = Date(timeIntervalSince1970: Double(airingAt))
            Text("Ep \(episode) \(relativeDate, format: .relative(presentation: .numeric))")
                .foregroundStyle(accentColor)
        }
    }
}

#Preview {
    AiringText(episode: 1, airingAt: 113983212)
}
