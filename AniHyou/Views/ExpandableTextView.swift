//
//  ExpandableTextView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI

struct ExpandableTextView: View {
    
    @State private var expanded: Bool = false
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
                .lineLimit(self.expanded ? nil : lineLimit)
                .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: { self.expanded.toggle() }) {
                Text(self.expanded ? "Show less" : "Show more")
                    .font(.footnote)
            }
        }
    }
}

struct ExpandableTextView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableTextView(text: .constant(NSAttributedString(string: "This is a preview")))
    }
}
