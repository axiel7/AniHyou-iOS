//
//  RoundedButton.swift
//  AniHyou
//
//  Created by Axel Lopez on 25/07/2024.
//

import SwiftUI

struct RoundedButtonStyle: PrimitiveButtonStyle {

    func makeBody(configuration: PrimitiveButtonStyle.Configuration) -> some View {
        RoundedButton(configuration: configuration)
    }
   
    struct RoundedButton: View {
        @State private var pressed = false

        let configuration: PrimitiveButtonStyle.Configuration

        var body: some View {
            configuration.label
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(.regularMaterial)
                .foregroundStyle(.tint)
                .compositingGroup()
                .opacity(pressed ? 0.5 : 1)
                .clipShape(Capsule())
                .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, perform: { }) { pressing in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        self.pressed = pressing
                    }
                }
        }
    }
}
