//
//  ExpandableTextView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI

struct ExpandableTextView: View {

    @State private var isExpanded = false
    var lineLimit: Int? = 3
    var fontSize: CGFloat = 16

    @Binding var text: NSAttributedString
    var styledText: AttributedString {
        var result = AttributedString(text)
        result.font = .systemFont(ofSize: fontSize)
        result.foregroundColor = .primary
        return result
    }

    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text(styledText)
                .lineLimit(isExpanded ? nil : lineLimit)
                .frame(maxWidth: .infinity, alignment: .leading)

            Button(
                action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                },
                label: {
                    Text(isExpanded ? "Show less" : "Show more")
                        .font(.footnote)
                }
            )
        }
    }
}

#Preview {
    ExpandableTextView(text: .constant(NSAttributedString(string: "This is a preview")))
}
