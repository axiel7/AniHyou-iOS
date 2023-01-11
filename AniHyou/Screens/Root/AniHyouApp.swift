//
//  AniHyouApp.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI

@main
struct AniHyouApp: App {
    
    @StateObject private var globalAppState = GlobalAppState.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .id(globalAppState.globalId)
        }
    }
}
