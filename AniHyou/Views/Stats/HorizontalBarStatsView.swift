//
//  FourStatusStatsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/01/2023.
//

import SwiftUI

struct HorizontalBarStatsView: View {

    @State private var screenWidth = UIScreen.main.bounds.width
    var stats: [Stat]
    init(stats: [Stat]) {
        self.stats = stats
    }

    private var totalValue: CGFloat {
        var total: CGFloat = 0
        stats.forEach { stat in
            total += stat.value
        }
        return total
    }

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(stats) { stat in
                        VStack {
                            Group {
                                if let idLocalized = stat.idLocalized {
                                    Text(idLocalized)
                                } else {
                                    Text(stat.id)
                                }
                            }
                            .foregroundColor(.white)
                            .padding(4)
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .foregroundColor(stat.color)
                            }
                            Text(stat.value.formatted())
                                .foregroundColor(stat.color)
                        }
                    }
                }
                .padding(.horizontal)
            }
            HStack(spacing: 0) {
                ForEach(stats) { stat in
                    Rectangle()
                        .frame(width: calculateProportionalWidth(stat.value), height: 12)
                        .foregroundColor(stat.color)
                }
            }
        }
    }

    private func calculateProportionalWidth(_ value: CGFloat) -> CGFloat {
        //simplified: ((value * 100 / totalValue) / 100) * screenWidth
        return value / totalValue * screenWidth
    }
}

#Preview {
    let stats = [
        Stat(id: "Planning", value: 6555, color: .green),
        Stat(id: "Current", value: 4991, color: .blue),
        Stat(id: "Paused", value: 522, color: .yellow),
        Stat(id: "Dropped", value: 146, color: .red)
    ]
    return HorizontalBarStatsView(stats: stats)
}
