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
            
            var headStyle = ""
            
            if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                headStyle = """
                <head>
                <style>
                body {
                    background-color: black;
                }
                p {
                    color: white;
                    font-family: Arial;
                    font-size: 2.5em !important;
                    margin-left: 1em;
                    margin-right: 1em;
                }
                img {
                    max-width: 100%;
                    margin-top: 1em;
                    margin-bottom: 1em;
                }
                .center {
                    display: block;
                    margin-left: auto;
                    margin-right: auto;
                }
                </style>
                </head>
                """
            } else {
                headStyle = """
                <head>
                <style>
                p {
                    font-family: Arial;
                    font-size: 2.5em !important;
                    margin-left: 1em;
                    margin-right: 1em;
                }
                img {
                    max-width: 100%;
                    margin-top: 1em;
                    margin-bottom: 1em;
                }
                .center {
                    display: block;
                    margin-left: auto;
                    margin-right: auto;
                }
                </style>
                </head>
                """
            }
            
            let styledHtml = "<html>" + headStyle + self.htmlString + "</html>"
            uiView.loadHTMLString(styledHtml, baseURL: self.baseURL)
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
