//
//  TranslationCredits.swift
//  AniHyou
//
//  Created by Axel Lopez on 14/10/2023.
//

import SwiftUI

private let translations = [
    "ar_SA": "yngams, Hussain889, Hussain69o, WhiteCanvas, eyadalomar, sakugaky, Comikazie, mlvin, bobteen1",
    "az_AZ": "oolyvi",
    "in_ID": "Clxf12, naturbrilian",
    "it_IT": "maicol07, DomeF, fraluc06",
    "ja_JP": "axiel7",
    "pl_PL": "xiggeush, YOGI_AOGI",
    "pt_BR": "Crono0, Torti, Ratolino, RickyM7, SamOak",
    "ru_RU": "Ronner231, grin3671",
    "es_ES": "axiel7",
    "tr_TR": "hsinankirdar",
    "uk_UA": "Syly_vibes, Sensetivity, magnariuk"
]

struct TranslationCredits: View {
    let locale = Locale.current
    var body: some View {
        Form {
            ForEach(translations.sorted(by: <), id: \.key) { lang, users in
                Section {
                    Text(users)
                } header: {
                    Text(locale.localizedString(forIdentifier: lang) ?? lang)
                }
            }
        }
    }
}

#Preview {
    TranslationCredits()
}
