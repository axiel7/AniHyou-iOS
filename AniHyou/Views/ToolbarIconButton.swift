//
//  ToolbarIconButton.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/06/2023.
//

import SwiftUI

struct ToolbarIconButton: View {

    let symbolSystemName: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: symbolSystemName)
                .font(.system(size: 13, weight: .semibold))
                .padding(8)
                .background(.ultraThinMaterial, in: .circle)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ToolbarIconButton(symbolSystemName: "chevron.left") {

    }
}
