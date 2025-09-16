//
//  Chip.swift
//  AniHyou
//
//  Created by Axel Lopez on 16/9/25.
//

import SwiftUI

struct Chip<Content: View>: View {
    
    let title: String
    @ViewBuilder let icon: Content
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            icon
            
            Text(title)
                .font(.callout)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .background {
            Capsule(style: .circular)
                .fill(.regularMaterial)
        }
    }
}

#Preview {
    Chip(title: "Top 100") {
        Image(systemName: "trophy.fill")
            .foregroundStyle(.yellow)
    }
}
