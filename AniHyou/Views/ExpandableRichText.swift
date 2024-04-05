//
//  ProfileBioView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI
import RichText

struct ExpandableRichText: View {

    @State private var isTruncated = false
    @State private var isExpanded = false
    let fontSize: CGFloat = 16

    private var html: String

    init(_ html: String?) {
        self.html = html ?? "No description"
    }

    private func determineTruncation(_ geometry: GeometryProxy) {
        // Calculate the bounding box we need to render the
        // text given the width from the GeometryReader.
        let total = html.boundingRect(
            with: CGSize(
                width: geometry.size.width,
                height: .greatestFiniteMagnitude
            ),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: fontSize)],
            context: nil
        )

        if total.size.height > geometry.size.height {
            isTruncated = true
        }
    }

    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            RichText(html: html)
                .defaultStyle()
                .frame(
                    maxWidth: .infinity,
                    maxHeight: isExpanded ? .greatestFiniteMagnitude : 32.0,
                    alignment: .topLeading
                )
                .background(alignment: .top) {
                    GeometryReader { geo in
                        Color.clear.onAppear {
                            determineTruncation(geo)
                        }
                    }
                }

            if isTruncated {
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
                .buttonStyle(.borderless)
                .background(.background)
            }
        }
    }
}

#Preview {
    ExpandableRichText("")
}
