//
//  MediaListScoreIndicator.swift
//  AniHyou
//
//  Created by Axel Lopez on 25/05/2023.
//

import SwiftUI
import AniListAPI

struct MediaListScoreIndicator: View {

    let score: Double
    let format: ScoreFormat
    var color: Color {
        if score == 0 { return .gray } else { return format.scoreColor(score: score) }
    }

    var body: some View {
        switch format {
        case .point100, .point10, .point5:
            HStack(alignment: .center) {
                if score == 0 {
                    Text(UNKNOWN_CHAR)
                } else {
                    Text(String(Int(score)))
                }
                Image(systemName: "star.fill")
            }
            .foregroundColor(color)
            .font(.footnote)
        case .point10Decimal:
            HStack(alignment: .center) {
                if score == 0 {
                    Text(UNKNOWN_CHAR)
                } else {
                    Text(score.formatted())
                }
                Image(systemName: "star.fill")
            }
            .foregroundColor(color)
            .font(.footnote)
        case .point3:
            if let icon = format.smileyIcon(score: Int(score)) {
                Image(icon)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(color)
            } else {
                Text(UNKNOWN_CHAR)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

#Preview {
    VStack(alignment: .trailing) {
        MediaListScoreIndicator(score: 0, format: .point100)
        MediaListScoreIndicator(score: 2.8, format: .point10Decimal)
        MediaListScoreIndicator(score: 3, format: .point3)
    }
}
