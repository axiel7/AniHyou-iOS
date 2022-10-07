//
//  StaffView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI

struct StaffView: View {
    
    static let imageSize: CGFloat = 70
    
    var staff: MediaStaff
    
    var body: some View {
        HStack {
            CircleImageView(imageUrl: staff.node?.image?.medium, size: StaffView.imageSize)
            
            VStack(alignment: .leading) {
                Text(staff.node?.name?.userPreferred ?? "")
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                Text(staff.role ?? "")
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            Spacer()
        }
        .frame(width: 240, height: StaffView.imageSize)
    }
}

struct StaffView_Previews: PreviewProvider {
    static var previews: some View {
        StaffView(staff: MediaStaff(fieldData: nil, variables: nil))
    }
}
