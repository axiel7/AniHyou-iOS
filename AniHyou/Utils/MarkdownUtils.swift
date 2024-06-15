//
//  MarkdownUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 12/09/2023.
//

import Foundation
import SwiftUI
import MarkdownUI
import Nuke
import NukeUI

extension Markdown {
    func defaultStyle(fontSize: CGFloat = 10) -> some View {
        self
            .markdownImageProvider(.kfImage)
            .markdownInlineImageProvider(.kfImage)
            .markdownTextStyle {
                FontSize(.em(fontSize))
            }
            .markdownBlockStyle(\.image) { configuration in
                configuration.label
                    .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
            }
    }
}

extension String {
    func formatMarkdown() -> String {
        var str = self
        // formats the weird AniList markdown syntax img(url) to the standard ![img](url)
        str.replace(/img(\d*%*)(\(.*?\))/) { matches in
            "\n![\(matches.1)]\(matches.2)"
        }
        // TODO: better format spoiler ~!!~
        str.replace(/~!(.*)!~/) { matches in
            "**SPOILER:** ~\(matches.1)~"
        }
        return str
    }
}

// Markdown image provider with Nuke
struct KFImageProvider: @preconcurrency ImageProvider {
    @MainActor
    func makeImage(url: URL?) -> some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

extension ImageProvider where Self == KFImageProvider {
    static var kfImage: Self {
        .init()
    }
}

// Markdown inline image provider with Nuke
struct NukeInlineImageProvider: InlineImageProvider {
    func image(with url: URL, label: String) async throws -> Image {
        if let image = try? await ImagePipeline.shared.image(for: url) {
            Image(uiImage: image)
                .resizable()
        } else {
            Image(systemName: "xmark.app")
        }
    }
}

extension InlineImageProvider where Self == NukeInlineImageProvider {
    static var kfImage: Self {
        .init()
    }
}
