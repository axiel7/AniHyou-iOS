//
//  ToolbarBackButton.swift
//  AniHyou
//
//  Created by Axel Lopez on 27/03/2024.
//

import SwiftUI

fileprivate extension View {
    @ViewBuilder
    func toolbarBackButtonSymbolStyle(scrolled: Bool) -> some View {
        if scrolled {
            self
                .foregroundStyle(.tint)
                .fontWeight(.semibold)
        } else {
            self
                .symbolVariant(.circle.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .ultraThinMaterial)
                .font(.system(size: 24, weight: .semibold))
        }
    }
}

struct ToolbarBackButton: View {

    var scrolled: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
        }
        .toolbarBackButtonSymbolStyle(scrolled: scrolled)
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    ToolbarBackButton(scrolled: false) {
        
    }
}
