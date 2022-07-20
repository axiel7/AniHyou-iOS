//
//  WebView.swift
//  AniHyou
//
//  Created by Axel Lopez on 7/7/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var htmlString: String
    @Binding var baseURL: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if self.htmlString != context.coordinator.lastLoadedHTML {
            context.coordinator.lastLoadedHTML = self.htmlString
            
            uiView.loadHTMLString(self.htmlString, baseURL: self.baseURL)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: WebView
        var lastLoadedHTML = ""
        
        // Empty but useful for when you need a navigation or ui delegate

        init(_ parent: WebView) {
            self.parent = parent
        }
    }
}
