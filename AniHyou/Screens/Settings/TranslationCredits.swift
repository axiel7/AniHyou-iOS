//
//  TranslationCredits.swift
//  AniHyou
//
//  Created by Axel Lopez on 14/10/2023.
//

import SwiftUI

struct TranslationCredits: View {
    var body: some View {
        Form {
            Section {
                Text(verbatim: "Ronner231")
            } header: {
                Text("Russian")
            }
            Section {
                Text(verbatim: "axiel7")
            } header: {
                Text("Spanish")
            }
            Section {
                Text(verbatim: "hsinankirdar")
            } header: {
                Text("Turkish")
            }
        }
    }
}

#Preview {
    TranslationCredits()
}
