//
//  SwiftUIUtils.swift
//  AniHyou
//
//  Created by Axel Lopez on 19/6/22.
//

import Foundation
import SwiftUI

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
