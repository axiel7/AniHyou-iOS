//
//  StaffView.swift
//  AniHyou
//
//  Created by Axel Lopez on 2/7/22.
//

import SwiftUI
import AniListAPI

struct StaffView: View {

    static let imageSize: CGFloat = 70

    let staff: MediaStaff

    var body: some View {
        NavigationLink(destination: StaffDetailsView(staffId: staff.node!.id)) {
            HStack {
                CircleImageView(imageUrl: staff.node?.image?.medium, size: StaffView.imageSize)

                VStack(alignment: .leading) {
                    Text(staff.node?.name?.userPreferred ?? "")
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.primary)
                    Group {
                        if let roleLocalized = staff.roleLocalized {
                            Text(roleLocalized)
                        } else {
                            Text(staff.role ?? "")
                        }
                    }
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.gray)
                    .font(.footnote)
                }
                Spacer()
            }
        }
        .buttonStyle(.plain)
        .frame(width: 240, height: StaffView.imageSize)
    }
}

#Preview {
    StaffView(staff: .init(_fieldData: nil))
}
