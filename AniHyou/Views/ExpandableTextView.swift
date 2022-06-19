//
//  ExpandableTextView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI

struct ExpandableTextView: View {
    
    @State private var expanded: Bool = false
    @State private var truncated: Bool = false
    var lineLimit: Int? = 3
    var fontSize: CGFloat = 16
    
    private var text: String
    init(_ text: String?) {
        self.text = text ?? ""
    }
    
    private func determineTruncation(_ geometry: GeometryProxy) {
        // Calculate the bounding box we need to render the
        // text given the width from the GeometryReader.
        let total = self.text.boundingRect(
            with: CGSize(
                width: geometry.size.width,
                height: .greatestFiniteMagnitude
            ),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: fontSize)],
            context: nil
        )
        
        if total.size.height > geometry.size.height {
            self.truncated = true
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text(self.text)
                .font(.system(size: fontSize))
                .lineLimit(self.expanded ? nil : lineLimit)
                .background(GeometryReader { geometry in
                    Color.clear.onAppear {
                        self.determineTruncation(geometry)
                    }
                })
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if self.truncated {
                Button(action: { self.expanded.toggle() }) {
                    Text(self.expanded ? "Show less" : "Show more")
                        .font(.footnote)
                }
            }
        }
    }
}

struct ExpandableTextView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableTextView(loremIpsum)
    }
}
