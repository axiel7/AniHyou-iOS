//
//  TranslationCredits.swift
//  AniHyou
//
//  Created by Axel Lopez on 14/10/2023.
//

import SwiftUI

private let translations = [
    "ja_JP": "axiel7",
    "ru_RU": "Ronner231, grin3671",
    "es_ES": "axiel7",
    "tr_TR": "hsinankirdar"
]

struct TranslationCredits: View {
    let locale = Locale.current
    var body: some View {
        Form {
            ForEach(translations.sorted(by: <), id: \.key) { lang, users in
                Section {
                    Text(users)
                } header: {
                    Text(locale.localizedString(forLanguageCode: lang) ?? lang)
                }
            }
        }
    }
}

#Preview {
    TranslationCredits()
}
