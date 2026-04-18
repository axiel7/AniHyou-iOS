//
//  MarkdownUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 12/09/2023.
//

import Foundation
import SwiftUI
import RegexBuilder

@MainActor
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

@MainActor
private let spoilerRegex = Regex {
    "~!"
    Capture {
        ZeroOrMore(.any)
    }
    "!~"
  }
  .anchorsMatchLineEndings()

extension String {
    @MainActor
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
