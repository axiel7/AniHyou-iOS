//
//  GlobalAppState.swift
//  AniHyou
//
//  Created by Axel Lopez on 13/11/2022.
//

import Foundation

@Observable
final class GlobalAppState {
    @MainActor
    static let shared = GlobalAppState()

    // We use this uuid to reset de root content view
    var globalId = UUID()
}
