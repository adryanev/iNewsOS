//
//  WebViewPage.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 02/04/23.
//

import Foundation
import WebKit
import SwiftUI

struct WebViewComponent: UIViewRepresentable {
    typealias UIViewType = WKWebView
    let webView: WKWebView
    let url: String
    
    init(url: String) {
        self.webView = WKWebView(frame: .zero)
        self.url = url
        self.webView.load(URLRequest(url: URL(string: self.url)!))
    }
    func makeUIView(context: Context) -> WKWebView {
            webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
}

