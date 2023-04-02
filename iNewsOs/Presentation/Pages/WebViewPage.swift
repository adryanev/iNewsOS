//
//  WebViewPage.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 02/04/23.
//

import SwiftUI

struct WebViewPage: View {
    let url: String
    var body: some View {
        WebViewComponent(url: url)
            .ignoresSafeArea()
            .frame(width: .infinity, height: .infinity)
            .navigationTitle("WebView")
        
    }
}

struct WebViewPage_Previews: PreviewProvider {
    static var previews: some View {
        let url = "https://google.com"
        WebViewPage(url: url)
    }
}
