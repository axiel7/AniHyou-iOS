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
    @Environment(\.scoreFormat) private var format: ScoreFormat
    var color: Color {
        format.color(score: Int(round(score)))
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
            .foregroundStyle(color)
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
            .foregroundStyle(color)
            .font(.footnote)
        case .point3:
            if let icon = format.smileyIcon(score: Int(score)) {
                Image(icon)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundStyle(color)
            } else {
                Text(UNKNOWN_CHAR)
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
        }
    }
}

#Preview {
    VStack(alignment: .trailing) {
        MediaListScoreIndicator(score: 0)
            .environment(\.scoreFormat, .point100)
        MediaListScoreIndicator(score: 2.8)
            .environment(\.scoreFormat, .point10Decimal)
        MediaListScoreIndicator(score: 3)
            .environment(\.scoreFormat, .point3)
    }
}
