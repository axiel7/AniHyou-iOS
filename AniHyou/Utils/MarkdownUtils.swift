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
import RegexBuilder

private let imageRegex = Regex {
    "img"
    Capture {
      Regex {
        ZeroOrMore(.digit)
        ZeroOrMore {
          "%"
        }
      }
    }
    Capture {
      Regex {
        "("
        ZeroOrMore(.reluctant) {
          /./
        }
        ")"
      }
    }
  }
  .anchorsMatchLineEndings()

private let spoilerRegex = Regex {
    "~!"
    Capture {
        ZeroOrMore(.any)
    }
    "!~"
  }
  .anchorsMatchLineEndings()

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
        // remove center tags, markdown doesnt support it
        str.replace("~~~", with: "")
        // formats the weird AniList markdown syntax img(url) to the standard ![img](url)
        str.replace(imageRegex) { matches in
            "\n![\(matches.1)]\(matches.2)"
        }
        // TODO: better format spoiler ~!!~
        str.replace(spoilerRegex) { matches in
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
