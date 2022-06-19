//
//  MediaStatView.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import SwiftUI

struct MediaStatView: View {
    
    var statTitle: String
    var statValue: String
    var showDivider = true
    
    var body: some View {
        VStack {
            Text(statTitle)
                .font(.caption2)
                .textCase(.uppercase)
                .foregroundColor(.gray)
                .padding(.bottom, 1)
            Text(statValue)
                .bold()
                .foregroundColor(.gray)
        }
        if showDivider {
            Divider()
                .padding(8)
        }
    }
}

struct MediaStatView_Previews: PreviewProvider {
    static var previews: some View {
        MediaStatView(statTitle: "Average Score", statValue: "88%")
    }
}
