//
//  StaffView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI

private let imageSize: CGFloat = 70

struct StaffView: View {
    
    var staff: MediaStaff
    
    var body: some View {
        HStack {
            CircleImageView(imageUrl: staff.node?.image?.medium, size: imageSize)
            
            VStack(alignment: .leading) {
                Text(staff.node?.name?.full ?? "")
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                Text(staff.role ?? "")
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
        .frame(height: imageSize)
    }
}

struct StaffView_Previews: PreviewProvider {
    static var previews: some View {
        StaffView(staff: MediaStaff())
    }
}
