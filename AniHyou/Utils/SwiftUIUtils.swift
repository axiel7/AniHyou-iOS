//
//  SwiftUIUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import Foundation
import SwiftUI
import Translation

// A magic trick for keeping the swipe to back functionality when navigationBarBackButtonHidden is set
// https://developer.apple.com/forums/thread/662510?answerId=672073022#672073022
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}

var isPhone: Bool {
    UIDevice.current.userInterfaceIdiom == .phone
}

var isLocaleEnglish: Bool {
    let lang = Locale.autoupdatingCurrent.language
    return lang.isEquivalent(to: .init(identifier: "en")) || lang.isEquivalent(to: .init(identifier: "en-UK"))
}

extension View {
    @ViewBuilder
    func translationPresentationCompat(isPresented: Binding<Bool>, text: String) -> some View {
        if #available(iOS 17.4, *) {
            self.translationPresentation(isPresented: isPresented, text: text)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func scrollTargetLayoutCompat() -> some View {
        if #available(iOS 17.0, *) {
            self.scrollTargetLayout()
        } else {
            self
        }
    }
    
    @ViewBuilder
    func scrollTargetBehaviorCompat() -> some View {
        if #available(iOS 17.0, *) {
            self.scrollTargetBehavior(.viewAligned(limitBehavior: .always))
        } else {
            self
        }
    }
}

struct RoundedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(.regularMaterial)
            .foregroundStyle(.tint)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .clipShape(Capsule())
    }
}
