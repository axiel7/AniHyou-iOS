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
    
    init() {
        #if DEBUG
        NFX.sharedInstance().start()
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
