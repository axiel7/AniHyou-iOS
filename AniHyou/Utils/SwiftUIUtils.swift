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
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}

@MainActor
var isPhone: Bool {
    UIDevice.current.userInterfaceIdiom == .phone
}

var isLocaleEnglish: Bool {
    let lang = Locale.autoupdatingCurrent.language
    return lang.isEquivalent(to: .init(identifier: "en")) || lang.isEquivalent(to: .init(identifier: "en-UK"))
}

var isiOS26: Bool {
    if #available(iOS 26, *) {
        return true
    } else {
        return false
    }
}

extension View {
    @ViewBuilder
    func glassEffectCompat(
        in shape: some Shape = .capsule,
        isEnabled: Bool = true
    ) -> some View {
        if #available(iOS 26, *), isEnabled {
            self.glassEffect(in: shape)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func buttonStyleGlassProminentCompat() -> some View {
        if #available(iOS 26, *) {
            self.buttonStyle(.glassProminent)
        } else {
            self.buttonStyle(.borderedProminent)
        }
    }
    
    @ViewBuilder
    func pinnedViewBackground(hasScrolled: Bool) -> some View {
        if #available(iOS 26, *) {
            self
                .glassEffectCompat(isEnabled: hasScrolled)
        } else {
            self
                .background(hasScrolled ? Material.bar.opacity(1.0) : Material.ultraThin.opacity(0.0))
        }
    }
}
