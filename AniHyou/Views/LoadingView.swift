//
//  LoadingView.swift
//  AniHyou
//
//  Created by Axel Lopez on 29/6/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
        }
        .frame(width: .infinity, height: .infinity, alignment: .center)
        .background {
            Rectangle()
                .foregroundColor(.primary)
                .colorInvert()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
