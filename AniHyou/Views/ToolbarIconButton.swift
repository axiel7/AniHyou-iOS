//
//  ToolbarIconButton.swift
//  AniHyou
//
//  Created by Axel Lopez on 18/06/2023.
//

import SwiftUI

struct ToolbarIconButton: View {
    
    var symbolSystemName: String
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Image(systemName: symbolSystemName)
                .foregroundColor(.black)
                .foregroundStyle(.thickMaterial)
                .font(.system(size: 15, weight: .semibold))
                .padding(8)
        }
        .buttonStyle(.plain)
        .background(.regularMaterial, in: Circle())
        .environment(\.colorScheme, .light)
    }
}

struct ToolbarIconButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarIconButton(symbolSystemName: "chevron.left") {
            
        }
    }
}
