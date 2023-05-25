//
//  MediaListScoreIndicator.swift
//  AniHyou
//
//  Created by Axel Lopez on 25/05/2023.
//

import SwiftUI
import API

struct MediaListScoreIndicator: View {
    
    var score: Double
    var format: ScoreFormat
    var color: Color {
        if score == 0 { return .gray } else { return format.scoreColor(score: score) }
    }
    
    var body: some View {
        switch format {
        case .point100, .point10, .point5:
            HStack(alignment: .center) {
                Image(systemName: "star.fill")
                if score == 0 {
                    Text(UNKNOWN_CHAR)
                } else {
                    Text(String(Int(score)))
                }
            }
            .foregroundColor(color)
            .font(.footnote)
        case .point10Decimal:
            HStack(alignment: .center) {
                Image(systemName: "star.fill")
                if score == 0 {
                    Text(UNKNOWN_CHAR)
                } else {
                    Text(score.formatted())
                }
            }
            .foregroundColor(color)
            .font(.footnote)
        case .point3:
            if score == 0 {
                Text(UNKNOWN_CHAR)
                    .foregroundColor(.gray)
                    .font(.footnote)
            } else {
                Image(format.smileyIcon(score: Int(score)))
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(color)
            }
        }
    }
}

struct MediaListScoreIndicator_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MediaListScoreIndicator(score: 0, format: .point100)
            MediaListScoreIndicator(score: 2.8, format: .point10Decimal)
            MediaListScoreIndicator(score: 3, format: .point3)
        }
    }
}
