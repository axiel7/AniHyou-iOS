//
//  MediaStatView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI

struct MediaStatView: View {

    let name: LocalizedStringKey
    let value: String?
    let valueLocalized: LocalizedStringKey?
    var showDivider = true
    
    init(name: LocalizedStringKey, value: String?, showDivider: Bool = true) {
        self.name = name
        self.value = value
        self.valueLocalized = nil
        self.showDivider = showDivider
    }
    
    init(name: LocalizedStringKey, value: LocalizedStringKey?, showDivider: Bool = true) {
        self.name = name
        self.value = nil
        self.valueLocalized = value
        self.showDivider = showDivider
    }

    var body: some View {
        VStack {
            Text(name)
                .font(.caption2)
                .textCase(.uppercase)
                .foregroundColor(.gray)
                .padding(.bottom, 1)
            Group {
                if let value {
                    Text(value)
                } else if let valueLocalized {
                    Text(valueLocalized)
                } else {
                    Text("Unknown")
                }
            }
            .bold()
            .foregroundColor(.gray)
        }
        .padding(.trailing, showDivider ? 0 : 8)
        if showDivider {
            Divider()
                .padding(8)
        }
    }
}

#Preview {
    MediaStatView(name: "Average Score", value: "88%")
}
