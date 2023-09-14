//
//  SwiftUIUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import Foundation
import SwiftUI
import RichText

extension RichText {
    func defaultStyle() -> RichText {
        @AppStorage(ACCENT_COLOR_KEY) var accentColor = ANIHYOU_COLOR
        return self
            .imageRadius(8)
            .linkColor(light: Color(hex: accentColor) ?? .accentColor, dark: Color(hex: accentColor) ?? .accentColor)
            .placeholder {
                ProgressView()
            }
    }
}

var spoilerCss =
    """
    .markdown_spoiler {
        color: grey;
        background-color: grey;
    }

    .markdown_spoiler:hover, .markdown_spoiler:focus, .markdown_spoiler:active {
        background-color: transparent;
    }
    """

func shareSheet(url: String) {
    DispatchQueue.main.async {
        let url = URL(string: url)
        let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

        let allScenes = UIApplication.shared.connectedScenes
        let scene = allScenes.first { $0.activationState == .foregroundActive }

        if let windowScene = scene as? UIWindowScene {
            windowScene.keyWindow?.rootViewController?.present(activityView, animated: true, completion: nil)
        }
    }
}

// A magic trick for keeping the swipe to back functionality when navigationBarBackButtonHidden is set
// https://developer.apple.com/forums/thread/662510?answerId=672073022#672073022
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

// Binding extension to use with a Picker so it can be deselected when picking the same value again
public extension Binding where Value: Equatable {
    init(_ source: Binding<Value>, deselectTo value: Value) {
        self.init(get: { source.wrappedValue },
                  set: { source.wrappedValue = $0 == source.wrappedValue ? value : $0 }
        )
    }
}
