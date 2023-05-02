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
    @State private var openMediaDetails = false
    @State private var mediaId = 0
    
    var body: some Scene {
        WindowGroup {
            Group {
                if openMediaDetails == false {
                    ContentView()
                        .id(globalAppState.globalId)
                        .onAppear {
                            //transfer use id from old app versions
                            if userId() == 0 {
                                saveUserId(id: UserDefaults.standard.integer(forKey: USER_ID_KEY))
                            }
                        }
                } else {
                    MediaDetailsView(mediaId: mediaId)
                        .id(mediaId)
                }
            }
            .onOpenURL { url in
                if url.scheme == "anihyou" {
                    openMediaDetails = true
                    mediaId = Int(url.lastPathComponent) ?? 0
                }
            }
        }
    }
}
