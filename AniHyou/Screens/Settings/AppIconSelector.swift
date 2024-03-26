//
//  AppIconSelector.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/07/2023.
//

import SwiftUI

struct AppIconSelector: View {

    let iconSize: CGFloat = 70
    private let appIcons = [
        "AniHyou-Default", "AniHyou-Green", "AniHyou-Red",
        "AniHyou-Purple", "AniHyou-Pink", "AniHyou-Orange", "AniHyou-Gray"
    ]
    @AppStorage(APP_ICON_KEY) private var selectedAppIcon = "AniHyou-Default"
    @AppStorage(HAS_DONATED_KEY, store: UserDefaults(suiteName: ANIHYOU_GROUP)) private var hasDonated = false
    let onNotDonated: () -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(appIcons, id: \.self) { icon in
                    let isSelected = selectedAppIcon == icon
                    let colorName = icon.replacingOccurrences(of: "AniHyou-", with: "")
                    VStack {
                        ZStack {
                            if isSelected {
                                RoundedRectangle(cornerRadius: 22.0)
                                    .foregroundStyle(.ultraThickMaterial)
                                    .frame(width: iconSize+4, height: iconSize+4)
                            }
                            Image(icon)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                                .frame(width: iconSize, height: iconSize)
                        }

                        if isSelected {
                            Text(colorName)
                                .fontWeight(.medium)
                                .foregroundStyle(.tint)
                        } else {
                            Text(colorName)
                        }
                    }//:VStack
                    .onTapGesture {
                        if hasDonated {
                            selectedAppIcon = icon
                            var iconName: String? = "AppIcon-\(colorName)"
                            if icon == "AniHyou-Default" {
                                iconName = nil
                            }
                            UIApplication.shared.setAlternateIconName(iconName) { error in
                                if let error = error {
                                    print(error)
                                }
                            }
                        } else {
                            onNotDonated()
                        }
                    }
                }
            }//:HStack
        }//:HScrollView
    }
}

#Preview {
    AppIconSelector {}
}
