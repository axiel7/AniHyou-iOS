//
//  AniHyouApp.swift
//  AniHyou
//
//  Created by Axel Lopez on 9/6/22.
//

import SwiftUI
import netfox

@main
struct AniHyouApp: App {
    
    @StateObject private var globalAppState = GlobalAppState.shared
    
    init() {
        #if DEBUG
        NFX.sharedInstance().start()
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .id(globalAppState.globalId)
        }
    }
}
