//
//  ToolbarIconButton.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/06/2023.
//

import SwiftUI

fileprivate extension View {
    @ViewBuilder
    func toolbarIconButtonForegroundStyle(scrolled: Bool, inverted: Bool) -> some View {
        if scrolled {
            if inverted {
                self.foregroundStyle(.white, .tint)
            } else {
                self.foregroundStyle(.tint, .ultraThinMaterial)
            }
        } else {
            if inverted {
                self.foregroundStyle(.regularMaterial, .primary)
            } else {
                self.foregroundStyle(.white, .ultraThinMaterial)
            }
        }
    }
}

struct ToolbarIconButton: View {

    let systemImage: String
    var inverted: Bool = false
    var scrolled: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
        }
        .symbolVariant(.circle.fill)
        .symbolRenderingMode(.palette)
        .toolbarIconButtonForegroundStyle(scrolled: scrolled, inverted: inverted)
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    ToolbarIconButton(systemImage: "heart", inverted: true, scrolled: false) {
        
    }
}
