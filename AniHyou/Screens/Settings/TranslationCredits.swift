//
//  TranslationCredits.swift
//  AniHyou
//
//  Created by Axel Lopez on 14/10/2023.
//

import SwiftUI

private let translations = [
    "id": "Clxf12",
    "ja_JP": "axiel7",
    "pt_BR": "Crono0, Torti, Ratolino, RickyM7, SamOak",
    "ru_RU": "Ronner231, grin3671",
    "es_ES": "axiel7",
    "tr_TR": "hsinankirdar",
    "uk_UA": "Syly_vibes, Sensetivity"
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
