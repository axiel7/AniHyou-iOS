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
    var values: [String]?
    var isExpandable: Bool = false
    var expandedContent: (() -> any View)?
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
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
                        .padding(.horizontal, 4)
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
                        .textSelection(.enabled)
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
        } else if let values {
            ForEach(values, id: \.self) {
                if !isExpanded && $0 != values[0] {
                    Text(", ") + Text(LocalizedStringKey(stringLiteral: $0))
                } else {
                    Text(LocalizedStringKey(stringLiteral: $0))
                }
            }
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
