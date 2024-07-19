//
//  VerticalBarsStatsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/01/2023.
//

import SwiftUI

struct VerticalBarsStatsView: View {

    private let maxBarHeight: CGFloat = 150
    var stats: [Stat]
    private var maxStatValue: CGFloat = 100
    init(stats: [Stat]) {
        self.stats = stats
        maxStatValue = stats.max(by: { first, second in first.value < second.value })?.value ?? maxBarHeight
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            if #available(iOS 17.0, *) {
                Spacer()
                    .containerRelativeFrame([.horizontal])
            }
            HStack(alignment: .bottom) {
                ForEach(stats) { stat in
                    VStack {
                        Text(stat.value.formatted())
                            .font(.footnote)
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .frame(width: 25, height: stat.value / maxStatValue * maxBarHeight)
                            .foregroundStyle(stat.color)
                        Group {
                            if let idLocalized = stat.idLocalized {
                                Text(idLocalized)
                            } else {
                                Text(stat.id)
                            }
                        }
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    }
                }
            }
            .padding(.horizontal)
            if #available(iOS 17.0, *) {
                Spacer()
                    .containerRelativeFrame([.horizontal])
            }
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    let stats = [
        Stat(id: "10", value: 52, color: Color("Score10")),
        Stat(id: "20", value: 25, color: Color("Score20")),
        Stat(id: "30", value: 78, color: Color("Score30")),
        Stat(id: "40", value: 143, color: Color("Score40")),
        Stat(id: "50", value: 249, color: Color("Score50")),
        Stat(id: "60", value: 420, color: Color("Score60")),
        Stat(id: "70", value: 874, color: Color("Score70")),
        Stat(id: "80", value: 922, color: Color("Score80")),
        Stat(id: "90", value: 605, color: Color("Score90")),
        Stat(id: "100", value: 312, color: Color("Score100"))
    ]
    return VerticalBarsStatsView(stats: stats)
}
