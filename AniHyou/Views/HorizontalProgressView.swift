//
//  HorizontalProgressView.swift
//  AniHyou
//
//  Created by Axel Lopez on 31/07/2023.
//

import SwiftUI

struct HorizontalProgressView: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

#Preview {
    HorizontalProgressView()
}
