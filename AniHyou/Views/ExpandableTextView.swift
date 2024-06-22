//
//  ExpandableTextView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI

struct ExpandableTextView: View {

    @State private var isExpanded = false
    @State private var showingTranslation = false
    let lineLimit = 3
    let fontSize: CGFloat = 16

    @Binding var text: NSAttributedString
    var styledText: AttributedString {
        var result = AttributedString(text)
        result.font = .systemFont(ofSize: fontSize)
        result.foregroundColor = .primary
        return result
    }
    var showTranslate = false

    var body: some View {
        VStack(spacing: 10) {
            Text(styledText)
                .lineLimit(isExpanded ? nil : lineLimit)
                .frame(maxWidth: .infinity, alignment: .leading)
                .translationPresentationCompat(
                    isPresented: $showingTranslation,
                    text: text.string
                )

            HStack {
                if showTranslate, #available(iOS 17.4, *) {
                    Button("Translate") {
                        showingTranslation = true
                    }
                }
                Spacer()
                Button(isExpanded ? "Show less" : "Show more") {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
            }//:HStack
            .font(.footnote)
        }
    }
}

#Preview {
    ExpandableTextView(text: .constant(NSAttributedString(string: "This is a preview")), showTranslate: true)
}
