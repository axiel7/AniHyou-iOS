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
                .foregroundStyle(.black)
                .foregroundStyle(.thickMaterial)
                .font(.system(size: 15, weight: .semibold))
                .padding(8)
        }
        .buttonStyle(.plain)
        .background(.regularMaterial, in: Circle())
        .environment(\.colorScheme, .light)
    }
}

#Preview {
    ToolbarIconButton(symbolSystemName: "chevron.left") {

    }
}
