//
//  MarkdownUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 12/09/2023.
//

import Foundation
import SwiftUI
import MarkdownUI
import Kingfisher

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
                    .clipShape(RoundedRectangle(cornerRadius: 4))
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

// Markdown image provider with Kingfisher
struct KFImageProvider: ImageProvider {
    func makeImage(url: URL?) -> some View {
        if url?.lastPathComponent.hasSuffix(".gif") == true {
            KFAnimatedImage(url)
                .scaledToFill()
        } else {
            KFImage(url)
                .resizable()
                .scaledToFill()
        }
    }
}

extension ImageProvider where Self == KFImageProvider {
    static var kfImage: Self {
        .init()
    }
}

// Markdown inline image provider with Kingfisher
struct KFInlineImageProvider: InlineImageProvider {
    func image(with url: URL, label: String) async throws -> Image {
        await withCheckedContinuation { continuation in
            KingfisherManager.shared.retrieveImage(with: url) { result in
                if let image = try? result.get().image {
                    continuation.resume(returning: Image(uiImage: image).resizable())
                } else {
                    continuation.resume(returning: Image(systemName: "xmark.app"))
                }
            }
        }
    }
}

extension InlineImageProvider where Self == KFInlineImageProvider {
    static var kfImage: Self {
        .init()
    }
}
