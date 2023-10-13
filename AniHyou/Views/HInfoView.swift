//
//  MediaInfoView.swift
//  AniHyou
//
//  Created by Axel Lopez on 24/6/22.
//

import SwiftUI

struct HInfoView: View {

    let name: LocalizedStringKey
    var value: String?
    var valueLocalized: LocalizedStringKey?
    var isExpandable: Bool = false
    var expandedContent: (() -> any View)?
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.trailing)
                Spacer()
                if !isExpanded {
                    valueText
                        .font(.subheadline)
                        .lineLimit(1)
                        .frame(alignment: .trailing)
                }
                if isExpandable {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            if isExpanded {
                if let expandedContent {
                    AnyView(expandedContent())
                } else {
                    valueText
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 1)
                }
            }
            Divider()
        }
        .onTapGesture {
            if isExpandable {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 7)
    }
    
    @ViewBuilder
    var valueText: some View {
        if let value {
            Text(value)
        } else if let valueLocalized {
            Text(valueLocalized)
        } else {
            Text("Unknown")
        }
    }
}

#Preview {
    VStack {
        HInfoView(name: "Start date", value: "12-12-2012")
        HInfoView(name: "Genres", value: "Action, Comedy, Slice of Life, Supernatural", isExpandable: true)
    }
}
