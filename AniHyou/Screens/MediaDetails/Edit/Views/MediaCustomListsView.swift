//
//  MediaCustomListsView.swift
//  AniHyou
//
//  Created by Axel Lopez on 20/05/2024.
//

import SwiftUI

struct MediaCustomListsView: View {
    
    @Binding var customLists: [String: Bool]
    
    var body: some View {
        List(customLists.keys.sorted(), id: \.self) { name in
            Button(action: { customLists[name]?.toggle() }) {
                HStack {
                    Text(name)
                    Spacer()
                    if customLists[name] == true {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.accent)
                    }
                }
                .contentShape(.rect) // fixes Spacer not tappable
            }
            .buttonStyle(.plain)
        }
        .navigationTitle("Custom lists")
    }
}

#Preview {
    MediaCustomListsView(
        customLists: .constant(["Preview": true, "AOTY": false])
    )
}
