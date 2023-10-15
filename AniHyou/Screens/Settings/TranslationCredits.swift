//
//  TranslationCredits.swift
//  AniHyou
//
//  Created by Axel Lopez on 14/10/2023.
//

import SwiftUI

private let translations = [
    "Japanese": "axiel7",
    "Russian": "Ronner231, grin3671",
    "Spanish": "axiel7",
    "Turkish": "hsinankirdar"
]

struct TranslationCredits: View {
    var body: some View {
        Form {
            ForEach(translations.sorted(by: <), id: \.key) { lang, users in
                Section {
                    Text(users)
                } header: {
                    Text(LocalizedStringKey(lang))
                }
            }
        }
    }
}

#Preview {
    TranslationCredits()
}
