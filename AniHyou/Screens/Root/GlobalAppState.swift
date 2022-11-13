//
//  GlobalAppState.swift
//  AniHyou
//
//  Created by Axel Lopez on 13/11/2022.
//

import Foundation

class GlobalAppState: ObservableObject {
    static let shared = GlobalAppState()
    
    // We use this uuid to reset de root content view
    @Published var globalId = UUID()
}
