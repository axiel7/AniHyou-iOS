//
//  MediaStatView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI

struct MediaStatView: View {
    
    var name: String
    var value: String
    var showDivider = true
    
    var body: some View {
        VStack {
            Text(name)
                .font(.caption2)
                .textCase(.uppercase)
                .foregroundColor(.gray)
                .padding(.bottom, 1)
            Text(value)
                .bold()
                .foregroundColor(.gray)
        }
        .padding(.trailing, showDivider ? 0 : 8)
        if showDivider {
            Divider()
                .padding(8)
        }
    }
}

struct MediaStatView_Previews: PreviewProvider {
    static var previews: some View {
        MediaStatView(name: "Average Score", value: "88%")
    }
}
