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
    "zh_Hans": "hualiong, MareDevi, Andypsl8, bengerlorf",
    "zh_Hant": "Gholts, jhih_yu_lin, web790709",
    "fr_FR": "0xybo, mamanamgae, frosqh, Eria78, nesquick",
    "de-DE": "LittleFreak, Secresa, MaximilianGT500, notsakin",
    "in_ID": "Clxf12, naturbrilian",
    "it_IT": "maicol07, DomeF, fraluc06",
    "ja_JP": "axiel7",
    "pl_PL": "xiggeush, YOGI_AOGI",
    "pt_BR": "Crono0, Torti, Ratolino, RickyM7, SamOak",
    "ru_RU": "Ronner231, grin3671, Speech100",
    "es_ES": "axiel7",
    "th-TH": "PiyaRawing",
    "tr_TR": "hsinankirdar",
    "uk_UA": "Syly_vibes, Sensetivity, magnariuk, DanielleTlumach"
]

struct TranslationCredits: View {
    let locale = Locale.current
    var body: some View {
        Form {
            ForEach(translations.sorted(by: <), id: \.key) { lang, users in
                Section {
                    Text(users)
                } header: {
                    let localizedLang = if lang.hasPrefix("zh") {
                        locale.localizedString(forIdentifier: lang)
                    } else {
                        locale.localizedString(forLanguageCode: lang)
                    }
                    Text(localizedLang ?? lang)
                }
            }
        }
        .navigationTitle("Translations")
    }
}

#Preview {
    TranslationCredits()
}
