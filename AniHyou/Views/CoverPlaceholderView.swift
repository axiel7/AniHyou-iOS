//
//  CoverPlaceholderView.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

struct CoverPlaceholderView: View {
    var systemName: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray)
                .frame(width: width, height: height)
            Image(systemName: systemName)
                .foregroundColor(.white)
        }
    }
}

struct CoverPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        CoverPlaceholderView(systemName: "hourglass", width: 80, height: 120)
            .previewLayout(.sizeThatFits)
    }
}
