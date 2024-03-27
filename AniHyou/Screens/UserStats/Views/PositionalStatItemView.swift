//
//  PositionalStatItemView.swift
//  AniHyou
//
//  Created by Axel Lopez on 27/03/2024.
//

import SwiftUI

struct PositionalStatItemView: View {
    
    let name: String
    let position: Int
    let count: Int
    let meanScore: Double
    var minutesWatched: Int?
    var chaptersRead: Int?
    var imageUrl: String?
    
    var minutesFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .month, .year]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                if let imageUrl {
                    CircleImageView(imageUrl: imageUrl, size: 50)
                        .padding(.trailing)
                }
                Text(name)
                    .fontWeight(.medium)
                Spacer()
                Text("#\(position)")
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background {
                        Capsule(style: .circular)
                            .fill(.regularMaterial)
                    }
            }//:HStack
            .padding(.bottom)
            HStack(alignment: .center, spacing: 20) {
                MediaStatView(
                    name: "Title count",
                    value: count.formatted(),
                    showDivider: false
                )
                MediaStatView(
                    name: "Mean score",
                    value: meanScore.formatted(),
                    showDivider: false
                )
                if let minutesWatched, minutesWatched > 0 {
                    MediaStatView(
                        name: "Time spent",
                        value: minutesFormatter.string(from: Double(minutesWatched * 60)),
                        showDivider: false
                    )
                } else if let chaptersRead, chaptersRead > 0 {
                    MediaStatView(
                        name: "Chapters read",
                        value: chaptersRead.formatted(),
                        showDivider: false
                    )
                }
            }
        }//:VStack
    }
}

#Preview {
    PositionalStatItemView(
        name: "Drama",
        position: 1,
        count: 282,
        meanScore: 81.71,
        minutesWatched: 87600
    )
    .padding()
}
