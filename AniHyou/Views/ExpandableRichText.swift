//
//  ProfileBioView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI
import RichText

struct ExpandableRichText: View {
    
    @State private var isExpanded = false
    
    private var html: String

    init(_ html: String?) {
        self.html = html ?? "No description"
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            RichText(html: html)
                .defaultStyle()
                .frame(maxWidth: .infinity, maxHeight: isExpanded ? .greatestFiniteMagnitude : 32.0, alignment: .topLeading)
            
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                Text(isExpanded ? "Show less" : "Show more")
                    .font(.footnote)
            }
        }
    }
}

struct ExpandableRichText_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableRichText("")
    }
}
